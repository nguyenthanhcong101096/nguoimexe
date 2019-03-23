# frozen_string_literal: true

class GroupsController < ApplicationController
  before_action :set_group, only: %i[show]
  layout 'social'

  def index; end

  def new; end

  def show
    @posts = Blog.with_mod(@group.name)
  end

  private

  def set_group
    @group = Group.find_by!(name: params[:name])
  end
end
