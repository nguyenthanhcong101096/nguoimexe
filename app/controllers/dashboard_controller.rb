# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @posts = Post.all.limit(10)
    @t = cookies[:name]
  end
end
