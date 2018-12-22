class ValidateUserParamsService
  STEP_ERRORS_OF_VALIDATE = [
    { step: '1', keys: %i[phone] },
    { step: '3', keys: %i[password password_confirmation] },
  ]
  
  def initialize(user, step)
    @user = user
    @step = step
  end
  
  def for_signup
    return { errors: {}, status: 'ok' } if @user.valid?
    
    keys = STEP_ERRORS_OF_VALIDATE.find { |v| v[:step] == @step }[:keys]
    errors = full_errors(keys)
    { errors: errors, status: errors.present? ? 'error' : 'ok' }
  end
  
  private

  def full_errors(keys)
    keys.each_with_object({}) { |k, o| o.merge!("#{k}": @user.errors.full_messages_for(k)) if @user.errors.messages[k].present? }
  end
end
