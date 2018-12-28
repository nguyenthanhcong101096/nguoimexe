class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from notify_for_user
  end

  def unsubscribed; end
  
  private
  
  def notify_for_user
    "notifications_#{user_id}_channel"  
  end
end
