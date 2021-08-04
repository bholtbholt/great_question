class Incentive < ApplicationRecord
  scope :redeemed, ->  { where(redeemed: true ) }
  scope :available, -> { where(redeemed: false) }

  class NullIncentive
    attr_reader :errors

    # NullIncentive will always have an error present so it functions
    # more like an actual Incentive with a problem (that it's nil)
    def initialize
      @errors = ActiveModel::Errors.new(self)
      @errors.add(:base, "No incentives are available")
    end

    def update(_ = nil)
      false
    end
  end

  Null = NullIncentive.new.freeze
end
