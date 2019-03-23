class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "messages_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  
  def read_messages
    conversation_ids = User.find(user_id).conversation_ids
    Message.where(conversation_id: conversation_ids).update_all(check: true)
    update_message_noti
  end
  
  private

  def update_message_noti
    ActionCable.server.broadcast 'messages_channel', type: 'read'
  end
end
