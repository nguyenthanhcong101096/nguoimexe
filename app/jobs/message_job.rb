# frozen_string_literal: true

class MessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast channel(message)[:room_channel], live_message(message)
    ActionCable.server.broadcast channel(message)[:noti_message], noti_message(message)
  end

  private

  def right_message(message)
    ApplicationController.renderer.render(partial: 'messages/new_message', locals: { message: message, type: 'right' })
  end

  def left_message(message)
    ApplicationController.renderer.render(partial: 'messages/new_message', locals: { message: message, type: 'left' })
  end

  def dropdown_message(conversation, message)
    ApplicationController.renderer.render(partial: 'shared/message', locals: { message: conversation, user: conversation.with_user(message.sender) })
  end

  def noti_message(message)
    conversation = message.conversation
    room_chat    = message.conversation_id.to_s
    target_user  = conversation.with_user(message.sender)
    msg_not_read = target_user.conversations.where(check: false).count

    { target_user: target_user.id.to_s, html: dropdown_message(conversation, message), room_chat: room_chat, counter: msg_not_read }
  end

  def live_message(message)
    { user_id: message.sender_id.to_s, last_message: message.msg, right_html: right_message(message), left_html: left_message(message) }
  end

  def channel(message)
    { room_channel: "room_chat_#{message.conversation_id}", noti_message: 'notification_messages_channel' }
  end
end
