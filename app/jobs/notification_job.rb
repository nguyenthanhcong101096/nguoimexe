class NotificationJob < ApplicationJob
  queue_as :default

  def perform(user, target_user, kind, url)
    ActionCable.server.broadcast 'notifications_channel', html: render_notify(user, target_user, kind, url)
  end
  
  private
  
  def render_notify (user, target_user, kind, url)
    activity = Activity.track(user, target_user, kind, url)
    html = "<p>#{activity.message}</p>"
  end
end
