class Api::IncentivesController < ApplicationController
  def index
    @incentives = Incentive.order(redeemed: :asc, updated_at: :desc)
    
    render json: @incentives.to_json
  end

  def update
    @incentive = Incentive.find(params[:id])

    @incentive.update!(update_params)
    render json: @incentive.to_json
  end

  private

  def update_params
    params.require(:incentive).permit(:code)
  end
end
