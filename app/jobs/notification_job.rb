class NotificationJob < ApplicationJob
  queue_as :default

  def perform(activity)
    ActionCable.server.broadcast "notifications_#{activity.target_user.id}_channel", html: render_notify(activity)
  end
  
  private
  
  def render_notify (activity)
    html = render_notification_comment(activity)
  end
  
  def render_notification_comment(activity)
    ApplicationController.renderer.render(partial: 'posts/notification_comment', locals: { activity: activity} )
  end
end
