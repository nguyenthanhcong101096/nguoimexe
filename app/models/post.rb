# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle_kind

  has_many :comments, dependent: :destroy
  has_many :post_images, dependent: :destroy
  
  before_create :slug
  
  delegate :username, :id, :avatar_url, to: :user, prefix: true
  delegate :name, to: :vehicle_kind, prefix: true
  include ImageUploader::Attachment.new(:featured_image)
  
  def created_date
    created_at.strftime('%d %b. %Y')
  end
  
  private
  
  def slug
    self.slug_title = self.title.parameterize
  end
end
