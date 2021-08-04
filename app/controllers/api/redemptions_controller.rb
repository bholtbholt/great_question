class Api::RedemptionsController < ApplicationController
  def create
    @incentive = Incentive.available.first || Incentive::Null

    if @incentive.update(redeemed: true)
      render json: { message: "Your code is: #{@incentive.code}. Thanks for participating in our research!" }
    else
      render json: { message: @incentive.errors.full_messages.to_sentence, errors: true }, status: :unprocessable_entity
    end
  end
end
