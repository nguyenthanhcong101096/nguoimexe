class Verify
  def valid_phone_number?(phone_number)
    response = Authy::PhoneVerification.start(country_code: '+84', phone_number: phone_number)
    response.success?
  end
  
  def check_verify?(code, phone_number)
    response = Authy::PhoneVerification.check(verification_code: code, country_code: '+84', phone_number: phone_number)
    response.success?
  end
end
