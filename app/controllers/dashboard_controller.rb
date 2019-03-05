# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @posts = Post.with_kind(params[:type]).filter(params).page(params[:page]).per(5)
    
    if call_api?
      block = render_to_string(partial: 'shared/post', collection: @posts)
      render json: { block: block, meta: { next_page: @posts.next_page, type_format: 'json' } }, status: :ok
    end
  end
end
