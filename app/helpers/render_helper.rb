# frozen_string_literal: true

module RenderHelper
  def render_notification_activity(user)
    notifications = Activity.where(target_user: user).order(created_at: :desc)
    count = notifications.where(read: 'false').count
    check = notifications.where(check: 'false').count
    render(partial: 'shared/notifications', locals: { notifications: notifications.limit(5), count: count, check: check })
  end

  def render_notification_message(user)
    messages = user.conversations
    count = messages.where(check: 'false').count
    check = Message.where(conversation_id: messages.ids).where.not(sender: user).pluck(:check).uniq.include?(false)
    render(partial: 'shared/messages', locals: { messages: messages, check: check, count: count })
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
