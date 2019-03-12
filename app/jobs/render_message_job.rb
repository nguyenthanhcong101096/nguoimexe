# frozen_string_literal: true

class RenderMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast channel(message.conversation_id), message_channel: message.conversation_id, to_user: message.sender_id, last_message: message.msg, html: render_new_message(message)
  end

  private

  def render_new_message(message)
    ApplicationController.renderer.render(partial: 'messages/new_message', locals: { message: message })
  end
  
  def channel(room_id)
    "message_channel_#{room_id}"
  end
end
