# frozen_string_literal: true

class DashboardController < ApplicationController
  layout 'writer', only: %(markup)

  def index
    @posts = Post.all.limit(10)
  end

  def markup; end
end
