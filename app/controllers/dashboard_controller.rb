# frozen_string_literal: true

class DashboardController < ApplicationController
  layout 'writer', only: %[markup]

  def index
    @posts = fetch_from_redis
  end

  def markup
  
  end
  
  private
  
  def fetch_from_redis
    posts = $redis.get "cache-posts"
    if posts.nil?
      posts = Post.includes(:user).limit(50)
      $redis.set("cache-posts", Marshal.dump(posts))
    end
    Marshal.load posts
  end
end
