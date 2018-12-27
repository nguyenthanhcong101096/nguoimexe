class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  
  def register_by_phone
    render json: SignUpService.new(params, user_params, self).execute!
  end
  
  def reset_password
    render json: ResetPasswordViaPhoneService.new(params, self).execute!
  end
  
  def show; end
  
  private
  
  def user_params
    params.permit(:username, :address, :password, :password_confirmation, :phone)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
