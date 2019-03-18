# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  before_action :set_post, only: %i[show]

  def new
    @post = Post.new
  end

  def create
    handle_submit_action
  end

  def show
    @posts = Post.all

    PostView.create!(post_id: @post.id, user_id: current_user&.id, ip_address: request.remote_ip) if countable?
  end

  def search
    @posts = Post.fulltext_search(params[:q])
  end

  def preview
    @post = Post.last
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

  def handle_submit_action
    if params[:submit_type] == 'preview'
      redirect_to preview_posts_url(previews_params.merge(images: params[:post][:images]))
    elsif params[:submit_type] == 'save'
      respone = PostService.new(current_user, params, 'post').create
      if respone
        redirect_to root_path
      else
        render :new
      end
    end
  end

  def previews_params
    params.require(:post).permit(:title, :describe, :vehicle_kind_id, :car_life, :capacity, :range_of_vehicle, :status_of_vehicle, :price, :year_of_registration, :km, :city_id)
  end
end
