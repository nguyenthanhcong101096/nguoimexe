class Verify
  
  def initialize(params)
    @params = params
  end
  
  def send_code
    response = Authy::PhoneVerification.start(country_code: '+84', phone_number: @params[:phone])
    response.success?
  end
  
  def verify_via_sms
    response = Authy::PhoneVerification.check(verification_code: @params[:code], country_code: '+84', phone_number: @params[:phone])
    response.success?
  end
end
