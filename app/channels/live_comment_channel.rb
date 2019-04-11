# frozen_string_literal: true

class LiveCommentChannel < ApplicationCable::Channel
  include TrackNotificationActivity

  def subscribed
    stream_from 'comments_channel'
  end

  def unsubscribed; end

  def create_comment(data)
    post = Post.find(data['post_id'])
    current_user.comments.create(context: data['message'], commentable: post)
    push_notification(current_user, post.user, 'comment', "https://nguoimexe.com/posts/#{post.slug_title}")
  end

  private

  def current_user
    User.find(user_id)
  end
end
