# frozen_string_literal: true

class ValidateService
  TYPE_ERRORS_OF_VALIDATE = [
    { type: 'post', keys: %i[title describe] },
    { type: 'signup', keys: %i[username email password] },
    { type: 'signin', keys: %i[email password] },
    { type: 'newfeed', keys: %i[title] }
  ].freeze

  def initialize(model, type)
    @model = model
    @type  = type
  end

  def excute!
    validattion
  end

  def validattion
    return { errors: {}, status: 'ok' } if @model.valid?

    keys = TYPE_ERRORS_OF_VALIDATE.find { |v| v[:type] == @type }[:keys]
    errors = full_errors(keys)
    { errors: errors, status: errors.present? ? 'error' : 'ok' }
  end

  private

  def full_errors(keys)
    keys.each_with_object({}) { |k, o| o.merge!("#{k}": @model.errors.full_messages_for(k)) if @model.errors.messages[k].present? }
  end
end
