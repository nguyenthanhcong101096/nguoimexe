# frozen_string_literal: true

class RenderMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast 'message_channel', message_channel: message.conversation_id, last_message: message.msg, html: render_new_message(message)
  end

  private

  def render_new_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end