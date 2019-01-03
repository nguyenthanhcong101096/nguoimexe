class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  
  after_create_commit { RenderMessageJob.perform_later self }
  
  delegate :username, :id, :avatar_url, to: :user, prefix: true
end
