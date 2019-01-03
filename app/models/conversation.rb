class Conversation < ApplicationRecord
  has_many :user_chats, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :group_chats, through: :user_chats, source: :user
  
  def with_user user
    group_chats.reject { |usr| usr == user }[0]
  end
  
  def last_message
    messages.last
  end
end
