# frozen_string_literal: true

class DashboardController < ApplicationController
  include CheckKeyWord
  
  def index
    posts = Post.all.limit(10)
    blogs = Blog.all.limit(10)

    @posts = (posts + blogs).shuffle
  end

  def markup
    @posts = Post.all
  end
end
