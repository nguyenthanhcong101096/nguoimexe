class BlogsController < ApplicationController
  layout 'writer', only: %i[new]
  
  def new
    
  end

  def create
    blog = current_user.blogs.create(params_blog.merge(img: params[:img]))
    if blog.save
      redirect_to root_path
    else
      render :new 
    end
  end
  
  def show
  end
  
  private
  
  def params_blog
    params.require(:blog).permit(:content, :title)
  end
end
