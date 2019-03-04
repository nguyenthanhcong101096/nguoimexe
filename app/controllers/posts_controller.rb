# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  
  before_action :set_post, only: %i[show]

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.create(post_params)
    redirect_to root_path
    # if post.save
    #   PostImage.create(post_imageable: post, post_image_data: params[:image])
    # end
  end

  def show
    @posts = Post.all.limit(8)
    @comments = @post.comments.limit(5).order(id: :desc)
  end

  def search
    @posts = Post.search_by_full_name(params[:q])
  end
  
  private

  def set_post
    @post = Post.find_by!(slug_title: params[:slug])
  end
  
  def post_params
    params.require(:post).permit(:title, :describe, :vehicle_kind_id, :car_life, :capacity, :range_of_vehicle, :status_of_vehicle, :price, :year_of_registration, :km, :city_id)
  end
end
