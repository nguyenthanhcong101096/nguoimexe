# frozen_string_literal: true

module RenderHelper
  def render_notification_activity(user)
    activities   = Activity.where(target_user: user)
    count_notify = activities.count
    render(partial: 'shared/notification', locals: { activities: activities, count_notify: count_notify })
  end

  def render_notification_message(user)
    activities   = Activity.where(target_user: user)
    count_notify = activities.count
    render(partial: 'shared/notification_message', locals: { activities: activities, count_notify: count_notify })
  end

  def render_conversations(user)
    conversations = user.conversations
    render(partial: 'messages/conversation', collection: conversations)
  end
end
