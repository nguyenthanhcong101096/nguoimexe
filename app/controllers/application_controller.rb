class ApplicationController < ActionController::Base
  before_action :set_locale
  
  private
  
  def set_locale
    params_locale = I18n.available_locales.map(&:to_s).find { |v| v === params[:locale] }
    I18n.locale = params_locale || cookies['locale'] || I18n.default_locale
    cookies['locale'] = I18n.locale.to_s
  end
end
