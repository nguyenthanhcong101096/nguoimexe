# frozen_string_literal: true

class CallbacksController < ApplicationController
  def google_oauth2
    generic_callback
  end
  
  def facebook
    generic_callback
  end
  
  private
  
  def generic_callback
    @identity = User.from_omniauth(request.env["omniauth.auth"])

    user = @identity || current_user
    if user.persisted?
      cookies.signed[:user_id] = user.id
      sign_in_and_redirect user
    else
      redirect_to root_path
    end
  end
end
