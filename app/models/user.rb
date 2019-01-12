# frozen_string_literal: true

class User < ApplicationRecord
  extend Enumerize
  
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :blogs, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :user_chats, dependent: :destroy
  has_many :conversations, through: :user_chats, source: :conversation
  
  has_many :active_relationships, class_name: 'Follow', dependent: :destroy, foreign_key: :user_id
  has_many :passive_relationships, class_name: 'Follow', dependent: :destroy, foreign_key: :target_user_id

  has_many :following, through: :active_relationships, source: :target_user
  has_many :followers, through: :passive_relationships, source: :user

  before_create :default_avatar, unless: :avatar
  after_create_commit :slug

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  validates :phone, uniqueness: true
  validates :phone, format: { with: /\d{3}\d{3}\d{4}/, message: 'bad format' }

  enumerize :range, in: %i[enterprise person], scope: true
  
  include ImageUploader::Attachment.new(:avatar)

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def follow?(user_id)
    following_ids.include?(user_id)
  end

  def follow(target_user)
    following << target_user
  end

  def unfollow(target_user)
    following.delete(target_user)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.type_account = 'email'
      user.provider = auth.provider
      user.uid = auth.uid
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def conversation_ids
    user_chats.pluck(:conversation_id)
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
