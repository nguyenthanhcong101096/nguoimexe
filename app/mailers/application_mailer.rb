# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'nguoimexesys@gmail.com'

  def reset_password_email(user)
    @user = user
    mail to: @user.email, subject: 'Reset Password'
  end
end
