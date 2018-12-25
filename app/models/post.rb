class Post < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle_kind
  
  has_many :comments
  has_many :activities, dependent: :destroy
  
  delegate :username, :id, :avatar_url, to: :user, prefix: true
  delegate :name, to: :vehicle_kind, prefix: true
end
