class Api::IncentivesController < ApplicationController
  def index
    @incentives = Incentive.order(redeemed: :asc, updated_at: :desc)
    
    render json: @incentives.to_json
  end

  def create
    @incentive = Incentive.new(incentive_params)

    if @incentive.save
      render json: { message: 'New incentive added', incentive: @incentive }.to_json
    else
      render json: { message: @incentive.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  def update
    @incentive = Incentive.find(params[:id])

    @incentive.update!(incentive_params)
    render json: @incentive.to_json
  end

  private

  def incentive_params
    params.require(:incentive).permit(:code, :redeemed)
  end
end
