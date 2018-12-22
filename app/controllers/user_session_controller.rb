class UserSessionController < ApplicationController
  def create
    @user = User.find_by(phone: params[:user][:phone])
    if @user&.valid_password?(params[:user][:password])
      sign_in(@user)
      redirect_to root_path
    else
      redirect_to root_path
      flash[:success] = "Email and Password invalid"
    end
  end
  
  def destroy
    sign_out(current_user)
    redirect_to root_path
  end
end
