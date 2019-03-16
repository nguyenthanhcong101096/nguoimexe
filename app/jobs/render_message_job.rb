# frozen_string_literal: true

class RenderMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast channel(message.conversation_id), user_id: message.sender_id.to_s, last_message: message.msg, right_html: right_message(message), left_html: left_message(message)
  end

  private

  def right_message(message)
    ApplicationController.renderer.render(partial: 'messages/new_message', locals: { message: message, type: 'right' })
  end

  def left_message(message)
    ApplicationController.renderer.render(partial: 'messages/new_message', locals: { message: message, type: 'left' })
  end

  def channel(room_id)
    "message_channel_#{room_id}"
  end
end
