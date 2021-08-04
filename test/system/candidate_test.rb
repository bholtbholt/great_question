require "application_system_test_case"

class CandidateTest < ApplicationSystemTestCase

  describe 'redeeming the incentive' do
    it 'should return a valid coupon code' do
      create(:incentive, code: 'COUPON_123')
      visit '/redeem'
      click_on 'Redeem'
      assert_text 'COUPON_123'
    end

    it 'should return an error message when there are no remaining codes' do
      visit '/redeem'
      click_on 'Redeem'
      assert_text 'No incentives are available'
    end
  end
end
