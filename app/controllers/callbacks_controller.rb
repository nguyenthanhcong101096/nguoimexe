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
    auth      = request.env["omniauth.auth"] 
    @identity = User.from_omniauth(auth)

    user = @identity || current_user
    if user.persisted?
      cookies.signed[:user_id] = user.id
      sign_in_and_redirect user
    else
      user = User.find_by(email: auth.info.email)
      cookies.signed[:user_id] = user.id
      sign_in_and_redirect user
    end
  end
end
