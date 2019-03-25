# frozen_string_literal: true

class RenderMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast channel(message.conversation_id), render_message(message)
    ActionCable.server.broadcast 'messages_channel', noti_message(message)
  end

  private

  def right_message(message)
    ApplicationController.renderer.render(partial: 'messages/new_message', locals: { message: message, type: 'right' })
  end

  def left_message(message)
    ApplicationController.renderer.render(partial: 'messages/new_message', locals: { message: message, type: 'left' })
  end

  def noti_message(message)
    conversation = message.conversation
    room_chat    = message.conversation_id.to_s
    target_user  = conversation.with_user(message.sender)
    
    html = ApplicationController.renderer.render(partial: 'shared/message', locals: { message: conversation, user: conversation.with_user(message.sender) })
    
    { target_user: target_user.id.to_s, html: html, room_chat: room_chat }
  end
  
  def render_message(message)
    { user_id: message.sender_id.to_s, last_message: message.msg, right_html: right_message(message), left_html: left_message(message) }
  end
  
  def channel(room_id)
    "message_channel_#{room_id}"
  end
end
