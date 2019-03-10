# frozen_string_literal: true

class ValidateService
  TYPE_ERRORS_OF_VALIDATE = [
    { type: 'post', keys: %i[title describe] },
    { type: 'sign_up', keys: %i[email password confirmation_password] },
    { type: 'sign_in', keys: %i[email password] },
    { type: 'newfeed', keys: %i[title] }
  ].freeze

  def initialize(model, type)
    @model = model
    @type  = type
  end

  def perform
    validattion
  end

  def validattion
    return { errors: {}, status: 'ok' } if @model.valid?

    keys = TYPE_ERRORS_OF_VALIDATE.find { |v| v[:type] == @type }[:keys]
    errors = full_errors(keys)
    binding.pry
    { errors: errors, status: errors.present? ? 'error' : 'ok' }
  end

  private

  def full_errors(keys)
    keys.each_with_object({}) { |k, o| o.merge!("#{k}": @model.errors.full_messages_for(k)) if @model.errors.messages[k].present? }
  end
end
