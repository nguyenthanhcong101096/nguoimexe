# frozen_string_literal: true

class UserSessionController < ApplicationController
  def new 
    redirect_to root_path if current_user
  end
  
  def create
    @user = User.find_by(email: params[:email])
    if @user&.valid_password?(params[:password])
      sign_in(@user)
      cookies.signed[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    sign_out(current_user)
    redirect_to root_path
  end
end
