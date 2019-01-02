class Conversation < ApplicationRecord
  has_many :user_chats, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :group_chats, through: :user_chats, source: :user
  
  def chat_with_user
    group_chats.last
  end
  
  def last_message
    messages.last
  end
end
