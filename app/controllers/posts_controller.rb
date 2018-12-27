class PostsController < ApplicationController
  layout 'writer', only: %i[new]
  
  before_action :set_post, only: %i[show]
  
  def new; end
  
  def create
    
  end
  
  def show
    @posts = Post.all.limit(8)
    @comments = @post.comments.limit(10).order(id: :desc)
  end
  
  private
  
  def set_post
    @post = Post.find(params[:id])
  end
end
