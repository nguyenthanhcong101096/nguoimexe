# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle_kind

  has_many :comments, dependent: :destroy
  has_many :post_images, dependent: :destroy

  delegate :username, :id, :avatar_url, to: :user, prefix: true
  delegate :name, to: :vehicle_kind, prefix: true

  def created_date
    created_at.strftime('%d %b. %Y')
  end
end
