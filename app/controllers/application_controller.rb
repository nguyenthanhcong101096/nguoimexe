# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from AppErrors::Error409, with: :conflict

  def conflict
    render json: { message: 'Conflict' }, status: :conflict
  end

  def not_found
    respond_to do |f|
      f.html do
        render 'pages/page_404', layout: 'application', status: :not_found
      end
      f.json { render json: { message: 'Not Found' }, status: :not_found }
    end
  end

  def render_422(error_message)
    render json: { message: 'Unprocessable Entity', errors: error_message }, status: :unprocessable_entity
  end

  private

  def set_locale
    params_locale = I18n.available_locales.map(&:to_s).find { |v| v == params[:locale] }
    I18n.locale = params_locale || cookies['locale'] || I18n.default_locale
    cookies['locale'] = I18n.locale.to_s
  end

  def call_api?
    params[:type_format] == 'json'
  end
end
