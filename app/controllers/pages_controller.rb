# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    @groups = Group.all
    @posts = Blog.with_mod('public')
    @t = cookies.signed[:user_id]
  end

  def page_404; end
end
