# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    @groups = Group.all
    @posts = Blog.with_mod('public')
  end

  def page_404; end
  def page_500; end
end
