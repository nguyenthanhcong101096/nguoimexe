# frozen_string_literal: true

module RenderHelper
  def render_notification_activity(user)
    notifications = Activity.where(target_user: user).order(created_at: :desc).limit(8)
    count = notifications.where(read: 'false').count
    render(partial: 'shared/notifications', locals: { notifications: notifications, count: count })
  end

  def render_notification_message(user)
    messages = user.conversations
    count = messages.count
    render(partial: 'shared/messages', locals: { messages: messages, count: count })
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
