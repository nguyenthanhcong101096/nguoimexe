# frozen_string_literal: true

class BlogsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :set_blog, only: %i[show]

  layout 'writer', only: %i[new]

  def index
    @posts = Blog.all.limit(10)
  end
  
  def new; end

  def create
    blog = current_user.blogs.create(params_blog.merge(img: params[:img]))
    if blog.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show; end

  private

  def params_blog
    params.require(:blog).permit(:content, :title)
  end

  def set_blog
    @blog = Blog.find_by!(slug_title: params[:slug])
  end
end
