# frozen_string_literal: true

class StreamCommentChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'comments_channel'
  end

  def unsubscribed; end
  
  def create_comment(data)
    post = Post.find(data['post_id'])
    Comment.create(user_id: user_id, context: data['message'],  commentable: post)
  end
end
