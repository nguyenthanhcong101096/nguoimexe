# frozen_string_literal: true

class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable
  has_many :post_images, as: :post_imageable

  include ImageUploader::Attachment.new(:img)

  before_create :slug

  delegate :username, :id, :avatar_url, to: :user, prefix: true

  def created_date
    created_at.strftime('%d %b. %Y')
  end

  private

  def slug
    self.slug_title = title.parameterize
  end
end
