require 'test_helper'

class IncentiveTest < ActiveSupport::TestCase
  setup do
    @available_incentive = create(:incentive)
    @redeemed_incentive = create(:incentive, redeemed: true)
  end

  test 'should return available incentives' do
    assert_equal [@available_incentive], Incentive.available
  end

  test 'should return redeemed incentives' do
    assert_equal [@redeemed_incentive], Incentive.redeemed
  end
end
