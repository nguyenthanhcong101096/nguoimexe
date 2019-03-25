# frozen_string_literal: true

class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'messages_channel'
  end

  def unsubscribed; end

  def click_message_dropdown
    conversations = current_user.conversations
    conversations.each { |conversation| conversation.senders_last_message(current_user).update(check: true) }
    update_message_noti
  end

  private

  def update_message_noti
    ActionCable.server.broadcast 'messages_channel', type: 'read'
  end
  
  def current_user
    User.find(user_id)
  end
end
