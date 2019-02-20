# frozen_string_literal: true

class GroupsController < ApplicationController
  before_action :set_group

  def index; end

  def show
    @posts = Blog.with_mod(@group.name)
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end
end
