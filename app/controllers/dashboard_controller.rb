# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @posts = Post.with_kind(params[:type]).page(params[:page]).per(5)
    @data_load_more = { kind: params[:type], next_page:  @posts.next_page }
  end
end
