# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[profile]
  before_action :set_user, only: %(show)

  def create
    user  = User.new(user_params)
    valid = ValidateService.new(user, 'sign_up').perform
    if user.save
      sign_in(user)
      cookies.signed[:user_id] = user.id
      redirect_to root_path
    end
  end
  
  def update; end

  def show; end

  def profile; end

  def change_password; end

  private

  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:email, :password, :username).merge(password_confirmation: params[:password])
  end
end
