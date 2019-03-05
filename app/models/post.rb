# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id                   :integer          not null, primary key
#  title                :string
#  describe             :string
#  user_id              :bigint(8)        not null
#  vehicle_kind_id      :bigint(8)        not null
#  status               :string           default("spending"), not null
#  featured_image_data  :text
#  car_life             :string           default("Unknown")
#  capacity             :string           default("Unknown")
#  range_of_vehicle     :string           default("Unknown")
#  status_of_vehicle    :string
#  price                :float            default(0.0), not null
#  year_of_registration :string           default("Unknown")
#  slug_title           :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle_kind
  belongs_to :city

  has_many :provinces, through: :city
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable
  has_many :post_images, as: :post_imageable

  before_create :slug

  delegate :username, :id, :avatar_url, :email, :phone, :created_date, to: :user, prefix: true
  delegate :name, to: :vehicle_kind, prefix: true
  delegate :name, to: :city, prefix: true

  include ImageUploader::Attachment.new(:featured_image)
  include PgSearch

  pg_search_scope :fulltext_search,
                  against: [:title],
                  order_within_rank: 'posts.updated_at ASC',
                  associated_against: {
                    city: [:name],
                    provinces: [:name],
                    vehicle_kind: [:name]
                  }

  scope :with_kind, -> (kind) { kind ? VehicleKind.with_kind(kind).posts : all } 
                  
  def created_date
    created_at.strftime('%d %b. %Y')
  end

  def address_sale
    "#{city.province_name}, #{city_name}"
  end

  # def order_type(type = nil)
  #   q = all
  #   q = q.order(created_at: :desc) if type 'latest'
  #   q
  # end
  
  def self.filter(params)
    q = all
    q = q.where(city_id: params[:city_id])                       if params[:city_id].present?
    q = q.where(price: [params[:price_min]..params[:price_max]]) if params[:price_min].present?
    q = q.where(status_of_vehicle: params[:status_of_vehicle])   if params[:status_of_vehicle].present?
    q
  end
  
  private

  def slug
    self.slug_title = title.parameterize
  end
end
