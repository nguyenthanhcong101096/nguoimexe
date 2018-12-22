class SignUpService
  def initialize(params, user_params, controller)
    @params      = params
    @user_params = user_params
    @verify      = Verify.new
    @controller  = controller
  end
  
  def execute!
    sign_up_via_phone_number
  end
  
  def sign_up_via_phone_number
    case @params[:step]
    when '1'
      @verify.valid?(@params[:phone])
      @user = User.new(phone: @params[:phone])
      valid_params.merge(phone: @params[:phone], step: '2')
    when '2'
      result = @verify.verify?(@params[:code], @params[:phone])
      { status: result ? 'success' : 'success', step: '3', errors: { code: ['verify code invalid'] } }
    when '3'
      @user = User.new(@user_params)
      if @user.save
        @controller.sign_in(@user)
        { status: 'success', step: '4' }
      else
        valid_params
      end
    end
  end
  
  private
  
  def valid_params
    ValidateUserParamsService.new(@user, @params[:step]).for_signup
  end
end
