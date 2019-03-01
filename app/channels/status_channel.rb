# frozen_string_literal: true

class StatusChannel < ApplicationCable::Channel
  def subscribed
    stream_from my_notifications
    status('online')
    render_html(user_id)
  end

  def unsubscribed
    status('offline')
    ActionCable.server.broadcast my_notifications, key: 'offline', user_id: user_id.to_s
  end

  private

  def status(status)
    User.find(user_id).update(status: status)
  end

  def my_notifications
    'online'
  end

  def render_html(user_id)
    html = ApplicationController.renderer.render(partial: 'shared/user', locals: { user: User.find(user_id) })
    ActionCable.server.broadcast my_notifications, html: html, key: 'online', user_id: user_id.to_s
  end
end
