# frozen_string_literal: true

class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from my_channel
  end

  def unsubscribed; end

  def read_notifications
    activities = Activity.where(target_user_id: user_id, check: false)
    activities.update_all(check: true)
    update_count_notifications
  end

  private

  def update_count_notifications
    ActionCable.server.broadcast my_channel, type: 'read'
  end

  def my_channel
    "notifications_#{user_id}_channel"
  end
end
