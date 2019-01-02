class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  
  delegate :username, :id, :avatar_url, to: :user, prefix: true
end
