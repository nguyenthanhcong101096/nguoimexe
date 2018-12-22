class UsersController < ApplicationController
  def create
    binding.pry
    @user = User.create!(user_params)
    sign_in(@user)
    redirect_to root_path
  end
  def show; end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :phone)
  end
end
