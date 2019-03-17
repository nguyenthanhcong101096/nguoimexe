class Api::V1::VehicleKindsController < Api::V1::BaseController
  before_action :set_kind, only: %i[show]
  
  def show
    render json: @kind, serializer: VehicleKindSerializer
  end
  
  private
  
  def set_kind
    @kind = VehicleKind.find(params[:id])
  end
end
