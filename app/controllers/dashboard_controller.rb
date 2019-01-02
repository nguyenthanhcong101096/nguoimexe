# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @posts = Post.all
  end

  def markup
    @posts = Post.all
  end
end
