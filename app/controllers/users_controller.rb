class UsersController < ApplicationController
  before_action :verify, only: %i[register_by_phone]
  
  def register_by_phone
    case params[:step]
    when '1'
      @verify.valid_phone_number?(params[:phone])
      @user = User.new(phone: params[:phone])
      session[:phone] = params[:phone]
      render json: ValidateUserParamsService.new(@user, params[:step]).for_signup.merge(phone: params[:phone], step: '2')
    when '2'
      result = @verify.check_verify?(params[:code], session[:phone])
      render json: { status: result ? 'success' : 'success', step: '3', errors: { code: ['Verify invalid'] } }
    when '3'
        @user = User.new(user_params.merge(phone: session[:phone]))
        if @user.save
          sign_in(@user)
          render json: { status: 'success', step: '4' }
        else
          render json: ValidateUserParamsService.new(@user, params[:step]).for_signup, status: :ok
        end
    end
  end
  
  def show; end
  
  private
  
  def user_params
    params.permit(:username, :address, :password, :password_confirmation)
  end
  
  def verify
    @verify = Verify.new
  end
end
