# frozen_string_literal: true

module RenderHelper
  def render_notification_activity(user)
    notifications = Activity.where(target_user: user).order(created_at: :desc)
    count         = notifications.where(read: 'false').count
    check_read    = notifications.where(check: 'false').count

    render(partial: 'shared/dropdown_notifications', locals: { notifications: notifications.limit(5), count: count, check: check_read })
  end

  def render_notification_message(user)
    conversations = user.conversations
    count         = conversations.where(check: 'false').count
    check_read    = conversations.each_with_object([]) { |k, o| o << k.senders_last_message(user)&.check || true }.uniq

    render(partial: 'shared/dropdown_messages', locals: { conversations: conversations, check: check_read.include?(false), count: count })
  end

  def render_conversations(user)
    conversations = user.conversations.order(updated_at: :desc)
    render(partial: 'messages/conversation', collection: conversations, locals: { users: [user], type: 'receive' })
  end

  def render_user_online(user)
    users = user.following.where(status: 'online')
    render(partial: 'shared/user', collection: users)
  end
end
