# frozen_string_literal: true

class ResetPasswordViaPhoneService
  def initialize(params, _controller)
    @params     = params
    @verify     = Verify.new(params)
  end

  def execute!
    reset_via_phone
  end

  def reset_via_phone
    case @params[:step]
    when 'verify-phone'
      if user = User.find_by(phone: @params[:phone])
        @verify.send_code
        { status: 'ok', step: 'verify-code', phone: @params[:phone] }
      else
        { status: 'error', message: 'Phone number is invalid or not registered' }
      end
    when 'verify-code'
      authy = @verify.verify_via_sms
      { status: authy ? 'ok' : 'error', step: 'change-password-via-sms', message: 'Invalid confirmation code' }
    when 'change-password-via-sms'
      user = User.find_by(phone: @params[:phone])

      if user.update(password: @params[:password], password_confirmation: @params[:password_confirmation])
        { status: 'ok', step: 'done' }
      else
        { status: 'error', message: 'password incorrect' }
      end
    end
  end
end
