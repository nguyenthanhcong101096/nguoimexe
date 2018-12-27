class NotificationJob < ApplicationJob
  queue_as :default

  def perform(current_user, target_user, kind, url, counter)
    ActionCable.server.broadcast 'notifications_channel',counter: counter, channel_user: target_user.id, html: render_notify(current_user, target_user, kind, url)
  end
  
  private
  
  def render_notify (current_user, target_user, kind, url)
    activity = Activity.track(current_user, target_user, kind, url)
    html = render_notification_comment(activity)
  end
  
  def render_notification_comment(activity)
    ApplicationController.renderer.render(partial: 'posts/notification_comment', locals: { activity: activity} )
  end
end
