class UserSessionController < ApplicationController
  def create
    user = User.find_by(email: params[:user][:email])
    if user.valid_password?(params[:user][:password])
      sign_in(user)
      { message: 'Signed in', code: 'signed_in', status: 'ok' }
    else
      { message: 'Invalid email or password', code: 'signin_fail', status: 'error' }
    end
  end
  
  def destroy
  
  end
end
