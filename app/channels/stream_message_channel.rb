# frozen_string_literal: true

class StreamMessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'message_channel'
  end

  def unsubscribed; end
end
