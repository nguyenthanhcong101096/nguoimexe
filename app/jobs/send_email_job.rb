# frozen_string_literal: true

class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(user)
    @user = user
    UserMailer.reset_password_email(@user).deliver_later
  end
end
