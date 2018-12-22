class UsersController < ApplicationController 
  before_action :verify, only: %i[verify_sms]
  
  def verify_sms
    case params[:step]
    when '1'
      @verify.valid_phone_number?(params[:phone])
      session[:phone] = params[:phone]
    when '2'
      result = @verify.check_verify?(params[:code], session[:phone].to_s)
      session[:verify] = result
    when '3'
      if session[:verify]
        @user = User.create!(user_params.merge(phone: session[:phone].to_s))
        sign_in(@user)
        redirect_to root_path
      else
        redirect_to page_404_path
      end
    end
  end
  
  def show; end
  
  private
  
  def user_params
    params.require(:user).permit(:address, :password, :password_confirmation)
  end
  
  def verify
    @verify = Verify.new
  end
end
