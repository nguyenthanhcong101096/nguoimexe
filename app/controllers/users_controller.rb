class UsersController < ApplicationController
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
end
