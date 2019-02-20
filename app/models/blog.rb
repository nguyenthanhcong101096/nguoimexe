# frozen_string_literal: true

class Blog < ApplicationRecord
  extend Enumerize

  belongs_to :user
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable
  has_many :post_images, as: :post_imageable

  scope :with_mod, ->(mod) { where(mod: mod) }
  scope :with_kid, ->(kind) { where(kind: kind) }

  enumerize :kind, in: %i[blog newfeed], scope: true

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
