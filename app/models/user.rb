# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string
#  phone                  :string
#  encrypted_password     :string           default(""), not null
#  address                :string
#  username               :string
#  avatar_data            :text
#  slug_name              :string
#  range                  :string
#  status                 :string           default("offline")
#  followers_count        :integer
#  following_count        :integer
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  provider               :string
#  uid                    :string
#  type_account           :string
#

class User < ApplicationRecord
  extend Enumerize

  has_many :groups, dependent: :destroy
  has_many :user_groups, dependent: :destroy
  has_many :enterprises, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :blogs, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :user_chats, dependent: :destroy, foreign_key: :sender_id
  has_many :conversations, through: :user_chats, foreign_key: :sender_id
  
  has_many :active_relationships, class_name: 'Follow', dependent: :destroy, foreign_key: :user_id
  has_many :passive_relationships, class_name: 'Follow', dependent: :destroy, foreign_key: :target_user_id

  has_many :following, through: :active_relationships, source: :target_user
  has_many :followers, through: :passive_relationships, source: :user

  before_create :default_avatar, unless: :avatar
  before_create :slug

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2 facebook]

  # validates :phone, format: { with: /\d{3}\d{3}\d{4}/, message: 'bad format' }

  enumerize :range, in: %i[enterprise person], scope: true

  include ImageUploader::Attachment.new(:avatar)

  def follow?(user_id)
    following_ids.include?(user_id)
  end

  def follow(target_user)
    following << target_user
  end

  def unfollow(target_user)
    following.delete(target_user)
  end

  def like(post)
    likes.create(likeable: post)
  end

  def dislike(post)
    like = likes.find_by(likeable: post)
    like.destroy
  end

  def liked_post?(post)
    likes.exists?(likeable: post)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      password = Devise.friendly_token[0, 20]
      user.type_account = 'email'
      user.email = auth.info.email
      user.username = auth.info.email
      user.provider = auth.provider
      user.uid = auth.uid
      user.password = password
      user.password_confirmation = password
    end
  end

  def created_date
    created_at.strftime('%d %b. %Y')
  end

  private

  def default_avatar
    file = File.open(LetterAvatar.generate(username, 300))
    self.avatar = file
  ensure
    File.delete(file.path)
  end

  def slug
    self.slug_name = username.parameterize
  end
end
