class Post < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle_kind
  
  has_many :comments
  
  delegate :username, :avatar_url, to: :user, prefix: true
  delegate :name, to: :vehicle_kind, prefix: true
end
