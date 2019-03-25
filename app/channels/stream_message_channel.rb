# frozen_string_literal: true

class StreamMessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "message_channel_#{room_id}"
  end

  def unsubscribed; end

  def send_message(data)
    attachment  = data['img'] ? data['img'] : nil
    new_message = sender.messages.create(conversation_id: data['conversation_id'], msg: data['msg'], attachment_data: attachment)
    new_message.conversation.update(check: false)
  end

  private

  def sender
    User.find(user_id)
  end
end
