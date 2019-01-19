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

  def render_list_blogs
    blogs = Blog.order('RANDOM()').limit(10).shuffle
    render(partial: 'blogs/blog', collection: blogs)
  end

  def render_list_posts
    posts = Post.order('RANDOM()').limit(10).shuffle
    render(partial: 'posts/post', collection: posts)
  end
end
