module RenderHelper
  def render_information_profile(from_view: false, locals: {}, current_user: nil)
    activities = Activity.where(target_user: current_user).order(created_at: :desc).limit(5)
    if from_view
      render(partial: 'users/user_info', locals: { activities: activities, user: current_user }.merge(locals))
    else
      render_to_string(partial: 'users/user_info', locals: { activities: activities, user: current_user, has_col_class: true }.merge(locals))
    end
  end

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
    conversation_ids = user.conversation_ids
    conversations = Conversation.conversations_of_user(conversation_ids)
    render(partial: 'messages/conversation', collection: conversations)
  end
  
  def render_list_blogs
    blogs = Blog.order("RANDOM()").limit(10).shuffle
    render(partial: 'blogs/blog', collection: blogs)
  end
end
