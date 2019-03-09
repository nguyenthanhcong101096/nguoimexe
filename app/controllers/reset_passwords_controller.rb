# frozen_string_literal: true

class ResetPasswordsController < ApplicationController
  before_action :signed?, if: -> { current_user }
  before_action :set_user, only: %i[edit update]

  def edit; end

  def update
    @user.update(password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      sign_in(@user)
      cookies.signed[:user_id] = @user.id
      redirect_to root_path
    else
      render :edit
    end
  end

  def forget_password; end

  def send_mail
    @user = User.find_by(email: params[:email])
    if @user
      @user.update(reset_password_token: Devise.friendly_token[0, 20])
      SendEmailJob.perform_later(@user)
      redirect_to root_path
    else
      render :forget_password
    end
  end

  private

  def signed?
    redirect_to root_path
  end

  def set_user
    @user = User.find_by!(reset_password_token: params[:token])
  end
end
