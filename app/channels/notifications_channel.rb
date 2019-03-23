# frozen_string_literal: true

class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from my_notifications
  end

  def unsubscribed; end

  def read_notifications
    activities = Activity.where(target_user_id: user_id, read: false)
    # activities.update_all(read: true)
    # update_count_notifications
  end

  private

  def update_count_notifications
    ActionCable.server.broadcast my_notifications, type: 'read'
  end

  def my_notifications
    "notifications_#{user_id}_channel"
  end
end
