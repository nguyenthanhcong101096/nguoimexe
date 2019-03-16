# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  before_action :set_post, only: %i[show]

  def new
    @post = Post.new
  end

  def create
    PostService.new(current_user, params, 'post').create
    # ValidateService.new(post, 'post').perform
    redirect_to root_path
  end

  def show
    @posts = Post.all
    @comments = @post.comments.limit(5).order(id: :desc)
  end

  def search
    @posts = Post.fulltext_search(params[:q])
  end

  private

  def set_post
    @post = Post.find_by!(slug_title: params[:slug])
  end
end
