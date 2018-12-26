class NotificationJob < ApplicationJob
  queue_as :default

  def perform(current_user, target_user, kind, url)
    ActionCable.server.broadcast 'notifications_channel', channel_user: target_user.id, html: render_notify(current_user, target_user, kind, url)
  end
  
  private
  
  def render_notify (current_user, target_user, kind, url)
    activity = Activity.track(current_user, target_user, kind, url)
    html = "<p>#{activity.message}</p>"
  end
end
