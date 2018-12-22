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
      auhty = @verify.verify?(@params[:code], @params[:phone])
      { status: auhty ? 'success' : 'error', step: '3', errors: { code: ['verify code invalid'] } }
    when '3'
      @user = User.create(@user_params)
      if valid_params[:errors].present?
        valid_params
      else
        @controller.sign_in(@user)
        { status: 'success', step: '4' }
      end
    end
  end
  
  private
  
  def valid_params
    ValidateUserParamsService.new(@user, @params[:step]).for_signup
  end
end
