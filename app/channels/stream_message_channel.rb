# frozen_string_literal: true

class StreamMessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "message_channel_#{room_id}"
  end

  def unsubscribed; end

  def send_message(data)
    msg = if data['img']
            Message.create(sender: sender, conversation_id: data['conversation_id'], msg: data['msg'], attachment_data: data['img'])
          else
            Message.create(sender: sender, conversation_id: data['conversation_id'], msg: data['msg'])
          end
    msg.conversation.update(check: false)
  end

  private

  def sender
    User.find(user_id)
  end
end
