# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create preview]
  before_action :set_post, only: %i[show]

  def new
    @post = Post.new
  end

  def create
    handle_submit_action
  end

  def show
    @posts = Post.all.limit(9)

    PostView.create!(post_id: @post.id, ip_address: request.remote_ip) if countable?
  end

  def search
    @posts = Post.fulltext_search(params[:q]).page(params[:page]).per(10)
  end

  def preview; end

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
      redirect_to preview_posts_url(post_params[:params_post].merge(images: preview_images))
    elsif params[:submit_type] == 'save'
      respone = PostService.new(current_user, post_params, 'post').create
      if respone
        redirect_to root_path
      else
        render :new
      end
    end
  end

  def post_params
    params_post = params.require(:post).permit(:title, :describe, :vehicle_kind_id, :car_life, :capacity, :range_of_vehicle, :status_of_vehicle, :price, :year_of_registration, :km, :city_id)
    params_pics = params[:post][:images]

    { params_post: params_post, params_pics: params_pics }
  end

  def preview_images
    post_params[:params_pics].each_with_object([]) do |file, arr|
      name = file.original_filename.parameterize
      File.open(Rails.root.join('public', 'uploads', name), 'wb') { |f| f.write(file.read) }
      arr << name
    end
  end
end
