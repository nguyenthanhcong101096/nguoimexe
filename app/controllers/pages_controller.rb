# frozen_string_literal: true

class PagesController < ApplicationController
  layout 'page', only: %i[page_404]

  def index
    @groups = Group.all
    @posts = Blog.with_mod('public')
  end

  def page_404; end

  def page_500; end

  def notifications
    @notifications = Activity.where(target_user: current_user).order(created_at: :desc).page(params[:page]).per(7)
  end
end
