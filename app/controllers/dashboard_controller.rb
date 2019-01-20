# frozen_string_literal: true

class DashboardController < ApplicationController
  layout 'writer', only: %[markup]

  def index
    posts = Post.all.limit(10)
    blogs = Blog.all.limit(10)

    @posts = (posts + blogs).shuffle
  end

  def markup
  
  end
end
