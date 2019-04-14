# frozen_string_literal: true

class LiveMessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_chat_#{room_id}"
  end

  def unsubscribed; end

  def send_message(data)
    attachment  = data['img'] || nil
    new_message = sender.messages.create(conversation_id: data['conversation_id'], msg: data['msg'], attachment_data: attachment)
    new_message.conversation.update(check: false)
  end

  def enter_message(data)
    ActionCable.server.broadcast "room_chat_#{room_id}", type: 'input', size: data['size'], avatar: data['avatar'], user_id: user_id.to_s
  end

  private

  def sender
    User.find(user_id)
  end
end
