class UserSessionController < ApplicationController
  def create
    @user = User.find_by(phone: params[:phone])
    if @user&.valid_password?(params[:password])
      sign_in(@user)
      cookies.signed[:user_id] = @user.id
      
      render json: { status: 'ok', message: 'Login success' }
    else
      render json: { status: 'error', message: 'Phone number or Pasword is incorrect' }
    end
  end
  
  def destroy
    sign_out(current_user)
    redirect_to root_path
  end
end
