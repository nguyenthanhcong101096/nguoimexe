# frozen_string_literal: true

class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'notification_messages_channel'
  end

  def unsubscribed; end

  def click_message_dropdown
    conversations = current_user.conversations
    conversations.each { |conversation| conversation.senders_last_message(current_user)&.update(check: true) }
    update_message_noti
  end

  private

  def update_message_noti
    ActionCable.server.broadcast 'notification_messages_channel', type: 'read', user_id: user_id
  end

  def current_user
    User.find(user_id)
  end
end
