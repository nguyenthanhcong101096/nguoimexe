# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  layout 'writer', only: %i[new]

  before_action :set_post, only: %i[show]

  def new; end

  def create; end

  def show
    @posts = Post.all.limit(8)
    @comments = @post.comments.limit(5).order(id: :desc)
  end

  private

  def set_post
    @post = Post.find_by!(slug_title: params[:slug])
  end
end
