# frozen_string_literal: true

class StreamMessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'message_channel'
  end

  def unsubscribed; end

  def send_message(data)
    current_user.messages.create(conversation_id: data['conversation_id'], msg: data['msg'])
  end

  private

  def current_user
    User.find(user_id)
  end
end
