# frozen_string_literal: true

module TrackNotificationActivity
  extend ActiveSupport::Concern

  def push_notification(target_user, kind, url)
    unless current_user == target_user
      activity = Activity.track(current_user, target_user, kind, request.base_url + url)
      NotificationJob.perform_later(activity)
    end
  end
end
