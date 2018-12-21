class UserSessionController < ApplicationController
  def create
    @user = User.find_by(email: params[:user][:email])
    if @user&.valid_password?(params[:user][:password])
      sign_in(@user)
      redirect_to root_path
    else
      redirect_to root_path
      flash[:success] = "Email and Password invalid"
    end
  end
  
  def destroy; end
end
