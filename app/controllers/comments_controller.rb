# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_post, only: %i[index create]

  include TrackNotificationActivity

  def index
    @comments = @post.comments.where('id < ?', params[:min_id]).limit(5).order(id: :desc)
    html_blocks = @comments.each_with_object([]) { |comment, arr| arr << render_to_string(partial: 'posts/comment', locals: { comment: comment }) }
    render json: { comments: html_blocks, min_id: @comments.last.id, max_id: @post.comments.first.id }, status: :ok
  end

  def create
    @comment = current_user.comments.build(comment_params.merge(commentable: @post))

    if @comment.save
      html_block = render_to_string(partial: 'posts/comment', locals: { comment: @comment })

      push_notification(@post.user, 'comment', "/posts/#{@post.id}")
      
      render json: { comment: html_block }, status: :ok
    else
      render_422(@comment.errors.messages)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:context)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
