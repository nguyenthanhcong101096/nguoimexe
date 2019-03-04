# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @posts = Post.with_kind(params[:type])
  end
end
