class UsersController < ApplicationController  
  def verify_sms
    Verify.new().valid_phone_number?(params[:phone])
    
  end
  
  def show
    binding.pry
  end
end
