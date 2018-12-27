class NotificationJob < ApplicationJob
  queue_as :default

  def perform(activity, counter)
    ActionCable.server.broadcast 'notifications_channel',counter: counter, channel_user: activity.target_user.id, html: render_notify(activity)
  end
  
  private
  
  def render_notify (activity)
    
    html = render_notification_comment(activity)
  end
  
  def render_notification_comment(activity)
    ApplicationController.renderer.render(partial: 'posts/notification_comment', locals: { activity: activity} )
  end
end

# activity = Activity.track(current_user, target_user, kind, url)
