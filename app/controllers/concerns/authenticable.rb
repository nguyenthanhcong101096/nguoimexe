module Authenticable
  extend ActiveSupport::Concern
  
  EXPIRED_TIME = 30.days
  ALGORITHM    = 'HS256'
  SECRET_KEY   = Rails.application.secrets.secret_key_base
  
  def authenticate_user!
    respond_to do |f|
      @current_user = User.find(jwt_decode['sub'])
      return
    rescue ActiveRecord::RecordNotFound
      f.json { render json: { messages: 'auth.messages.unauthorized', code: 'unauthenticated' }, status: :unauthorized }
    rescue JWT::ExpiredSignature
      f.json { render json: { messages: 'auth.messages.access_token_expired', code: 'unauthenticated' }, status: :unauthorized }
    rescue JWT::VerificationError, JWT::DecodeError
      f.json { render json: { message: I18n.t('auth.messages.access_token_invalid'), code: 'unauthenticated' }, status: :unauthorized }
    end
  end
  
  def token
    session[:access_token] || request.headers['Authorization']&.split&.last
  end
  
  def jwt_encode(data = {})
    JWT.encode(payload(data), SECRET_KEY, ALGORITHM)
  end
  
  def jwt_decode
    JWT.decode(token, SECRET_KEY, true, { algorithm: ALGORITHM }).first
  end
  
  def current_user
    @current_user
  end
  
  def payload(data)
    {
      exp: Time.current.to_i + EXPIRED_TIME.to_i,
      jti: SecureRandom.uuid
    }.merge(data)
  end
end
