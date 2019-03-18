# frozen_string_literal: true

class Api::V1::BrandsController < Api::V1::BaseController
  before_action :set_brand, only: %i[show]

  def show
    render json: @brand, serializer: BrandSerializer
  end

  private

  def set_brand
    @brand = Brand.find(params[:id])
  end
end
