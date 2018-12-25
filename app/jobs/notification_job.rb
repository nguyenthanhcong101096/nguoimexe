class NotificationJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast 'notifications_channel', html: render_notify(message)
  end
  
  private
  
  def render_notify message
    html = "<p>#{message}</p>"
  end
end
