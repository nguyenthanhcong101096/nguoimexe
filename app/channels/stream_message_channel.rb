# frozen_string_literal: true

class StreamMessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "message_channel_#{room_id}"
  end

  def unsubscribed; end

  def send_message(data)
    Message.create(sender: sender, conversation_id: data['conversation_id'], msg: data['msg'])
  end

  private

  def sender
    User.find(user_id)
  end
end
