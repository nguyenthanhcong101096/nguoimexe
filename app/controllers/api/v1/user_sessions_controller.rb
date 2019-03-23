# frozen_string_literal: true

class Api::V1::UserSessionsController < Api::V1::BaseController
  def create
    user = User.find_by(email: params[:email])
    if user&.valid_password?(params[:password])
      cookies_and_sign_in(user)
      render json: { messages: 'login success', status: :ok }
    else
      render json: { messages: 'login fail', status: :not_found }
    end
  end

  def signup
    user     = User.new(params_user)
    validate = ValidateService.new(user, 'signup').excute!
    if user.save || validate[:errors].empty?
      cookies_and_sign_in(user)
      render json: { message: 'success', status: :ok }
    else
      render json: validate
    end
  end

  private

  def params_user
    params.permit(:email, :username, :password).merge(password_confirmation: params[:password])
  end

  def cookies_and_sign_in(user)
    sign_in(user)
    cookies.signed[:user_id] = user.id
  end
end
