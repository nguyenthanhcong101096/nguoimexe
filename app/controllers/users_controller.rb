# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update change_password set_password]

  def register_by_phone
    render json: SignUpService.new(params, user_params, self).execute!
  end

  def reset_password
    render json: ResetPasswordViaPhoneService.new(params, self).execute!
  end

  def edit; end

  def change_password; end

  def set_password
    if @user.update_with_password(password_params)
      redirect_to user_path
    else
      render :change_password
    end
  end

  def update
    if @user.update(user_update_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def show
    @posts = @user.posts
  end

  private

  def password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end

  def user_update_params
    params.require(:user).permit(:username, :address, :phone)
  end

  def user_params
    params.permit(:username, :address, :password, :password_confirmation, :phone)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
