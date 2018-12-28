# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @posts = Post.all
  end
end
