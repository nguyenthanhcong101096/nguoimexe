# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[profile]
  before_action :set_user, only: %(show)

  def update; end
  
  def show; end

  def profile; end

  def change_password; end
  
  private

  def set_user
    @user = User.find(params[:id])
  end
end
