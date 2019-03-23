# frozen_string_literal: true

class RenderMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast channel(message.conversation_id), user_id: message.sender_id.to_s, last_message: message.msg, right_html: right_message(message), left_html: left_message(message)
    ActionCable.server.broadcast "messages_channel", html: noti_message(message)[:html], target_user: noti_message(message)[:target_user].to_s
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
    target_user  = conversation.with_user(message.sender)
    
    html = ApplicationController.renderer.render(partial: 'shared/message', locals: { message: conversation, user: conversation.with_user(message.sender) })
    { target_user: target_user.id, html: html}
  end
  
  def channel(room_id)
    "message_channel_#{room_id}"
  end
end
