# frozen_string_literal: true

# == Schema Information
#
# Table name: blogs
#
#  id            :integer          not null, primary key
#  title         :string
#  content       :text
#  img_data      :text
#  user_id       :bigint(8)
#  kind          :string           default("newfeed")
#  mod           :string           default("public")
#  like_count    :integer
#  view_count    :integer
#  comment_count :integer
#  slug_title    :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Blog < ApplicationRecord
  extend Enumerize

  before_create :slug

  belongs_to :user
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable
  has_many :post_images, as: :post_imageable

  scope :with_mod, ->(mod) { where(mod: mod) }
  scope :with_kid, ->(kind) { where(kind: kind) }

  enumerize :kind, in: %i[blog newfeed], scope: true

  include ImageUploader::Attachment.new(:img)

  delegate :username, :id, :avatar_url, to: :user, prefix: true

  def created_date
    created_at.strftime('%d %b. %Y')
  end

  private

  def slug
    self.slug_title = title.parameterize
  end
end
