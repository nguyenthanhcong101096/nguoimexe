class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  delegate :username, :avatar_url, to: :user, prefix: true
  after_create_commit { RenderCommentJob.perform_later self }
end
