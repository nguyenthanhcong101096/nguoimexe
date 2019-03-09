# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: ENV['gmail_username']

  def reset_password_email(user)
    @user = user
    mail to: @user.email, subject: 'Reset Password'
  end
end
