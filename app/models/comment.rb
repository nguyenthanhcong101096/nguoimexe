class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  has_many :notifications
  
  delegate :username, :avatar_url, to: :user, prefix: true
  
  def created_date
    created_at.strftime('%d %b. %Y')
  end
end
