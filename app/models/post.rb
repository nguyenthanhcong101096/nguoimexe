# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id                  :integer          not null, primary key
#  title               :string
#  describe            :string
#  user_id             :bigint(8)        not null
#  vehicle_kind_id     :bigint(8)        not null
#  status              :string           default("spending"), not null
#  featured_image_data :text
#  product_date        :string           default("Unknown")
#  brand               :string           default("Unknown"), not null
#  registration        :float            default(0.0), not null
#  price               :float            default(0.0), not null
#  slug_title          :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle_kind

  has_many :comments, as: :commentable
  has_many :likes, as: :likeable
  has_many :post_images, as: :post_imageable

  before_create :slug

  delegate :username, :id, :avatar_url, to: :user, prefix: true
  delegate :name, to: :vehicle_kind, prefix: true

  include ImageUploader::Attachment.new(:featured_image)

  def created_date
    created_at.strftime('%d %b. %Y')
  end

  private

  def slug
    self.slug_title = title.parameterize
  end
end
