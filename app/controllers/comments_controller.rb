# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_post, only: %i[index]

  def index
    @comments = @post.comments.where('id < ?', params[:min_id]).limit(5).order(id: :desc)
    html_blocks = @comments.each_with_object([]) { |comment, arr| arr << render_to_string(partial: 'posts/comment', locals: { comment: comment }) }
    render json: { comments: html_blocks, min_id: @comments.last.id, max_id: @post.comments.first.id }, status: :ok
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
