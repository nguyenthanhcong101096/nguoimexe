# frozen_string_literal: true

class NotificationJob < ApplicationJob
  queue_as :default

  def perform(activity)
    ActionCable.server.broadcast "notifications_#{activity.target_user.id}_channel", html: render_notification_comment(activity)
  end

  private

  def render_notification_comment(activity)
    ApplicationController.renderer.render(partial: 'shared/acitivity', locals: { activity: activity })
  end
end
