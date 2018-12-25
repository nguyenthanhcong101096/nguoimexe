class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  delegate :username, :avatar_url, to: :user, prefix: true
  after_create_commit { NotificationJob.perform_later('Có 1 bình luận mới')}  
  def created_date
    created_at.strftime('%d %b. %Y')
  end
end
