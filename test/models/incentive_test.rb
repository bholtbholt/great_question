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

  describe '.NullIncentive' do
    test '#update should return false' do
      refute Incentive::Null.update(anything: false)
    end

    test '#errors should return an ActiveModel::Errors object' do
      assert_kind_of ActiveModel::Errors, Incentive::Null.errors
      assert_equal "No incentives are available", Incentive::Null.errors.full_messages.to_sentence
    end
  end
end
