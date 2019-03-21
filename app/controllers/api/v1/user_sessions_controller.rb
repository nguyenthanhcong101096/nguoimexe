# frozen_string_literal: true

class Api::V1::UserSessionsController < Api::V1::BaseController
  def create
    @user = User.find_by(email: params[:email])
    if @user&.valid_password?(params[:password])
      sign_in(@user)
      cookies.signed[:user_id] = @user.id
      render json: { messages: 'login success', status: :ok }
    else
      render json: { messages: 'login fail', status: :not_found }
    end
  end
end
