# frozen_string_literal: true

class MessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast channel(message)[:room_channel], live_message(message)
    ActionCable.server.broadcast channel(message)[:noti_message], noti_message(message)
  end

  private

  def right_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message, type: 'right' })
  end

  def left_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message, type: 'left' })
  end

  def conversation(conversation, message)
    ApplicationController.renderer.render(partial: 'messages/conversation', locals: { conversation: conversation, users: conversation.with_users(message.sender), type: 'sent' })
  end

  def receive_conversation(conversation, message)
    ApplicationController.renderer.render(partial: 'messages/conversation', locals: { conversation: conversation, users: conversation.with_users(message.sender), type: 'receive' })
  end

  def noti_message(message)
    conversation = message.conversation
    room_members = conversation.room_members.pluck(:id)
    room_chat    = message.conversation_id.to_s
    multi_user   = conversation.with_users(message.sender).pluck(:id)
    msg_not_read = 0

    { room_members: room_members, receiver: multi_user, sent_html: conversation(conversation, message), receive_html: receive_conversation(conversation, message), room_chat: room_chat, counter: msg_not_read }
  end

  def live_message(message)
    { user_id: message.sender_id.to_s, last_message: message.msg, right_html: right_message(message), left_html: left_message(message) }
  end

  def channel(message)
    { room_channel: "room_chat_#{message.conversation_id}", noti_message: 'notification_messages_channel' }
  end
end
