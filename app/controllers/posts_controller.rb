class PostsController < ApplicationController
  before_action :set_post, only: %i[show]
  
  def show
    @posts = Post.all.limit(8)
  end
  
  private
  
  def set_post
    @post = Post.find(params[:id])
  end
end
