# frozen_string_literal: true

class CallbacksController < ApplicationController
  def google_oauth2
    user = User.from_omniauth(request.env['omniauth.auth'])
    cookies.signed[:user_id] = user.id
    sign_in_and_redirect user
  end
  
  def facebook
    user = User.from_omniauth(request.env['omniauth.auth'])
    cookies.signed[:user_id] = user.id
    sign_in_and_redirect user
  end
end
