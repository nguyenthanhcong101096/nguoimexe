# frozen_string_literal: true

module RenderHelper
  def render_notification_activity(user)
    activities = Activity.where(target_user: user, read: false)
    count = activities.count
    render(partial: 'shared/notifications', locals: { activities: activities, count: count })
  end

  def render_notification_message(user)
    activities = Activity.where(target_user: user, read: false)
    count = activities.count
    render(partial: 'shared/messages', locals: { activities: activities, count: count })
  end

  def render_conversations(user)
    conversations = user.conversations
    render(partial: 'messages/conversation', collection: conversations)
  end
  
  def render_user_online(user)
    users = user.following.where(status: 'online')
    render(partial: 'shared/user', collection: users)
  end
end
