# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  before_action :set_post, only: %i[show]

  def new
    @post = Post.new
  end

  def create
    response = PostService.new(current_user, params, 'post').create
    response ? (redirect_to root_path) : (render :new)
  end

  def show
    @posts = Post.all

    PostView.create!(post_id: @post.id, user_id: current_user&.id, ip_address: request.remote_ip) if countable?
  end

  def search
    @posts = Post.fulltext_search(params[:q])
  end

  private

  def set_post
    @post = Post.find_by!(slug_title: params[:slug])
  end

  def countable?
    post_view = PostView.find_by(post_id: @post.id, ip_address: request.remote_ip)
    return true unless post_view
    return true if post_view.created_at < PostView.threshold

    false
  end
end
