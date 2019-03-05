# frozen_string_literal: true

class Api::V1::ProvincesController < Api::V1::BaseController
  before_action :set_province, only: %i[show]
  
  def show
    render json: @province, serializer: ProvinceSerializer
  end
  
  private
  
  def set_province
    @province = Province.find(params[:id])
  end
end
