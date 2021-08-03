class Incentive < ApplicationRecord
  scope :redeemed, ->  { where(redeemed: true ) }
  scope :available, -> { where(redeemed: false) }
end
