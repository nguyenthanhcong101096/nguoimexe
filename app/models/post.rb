class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  
  delegate :username, :avatar_url, to: :user, prefix: true
end
