class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  
  delegate :username, to: :user, prefix: true
end
