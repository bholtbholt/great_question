require "application_system_test_case"

class ResearcherTest < ApplicationSystemTestCase

  describe 'viewing_incentive' do
    setup do 
      create(:incentive, code: 'COUPON_123')
    end

    it 'should_show_the_current_coupon' do
      visit '/setup'
      assert_equal 'COUPON_123', find_field('incentive_code').value
  describe 'creating incentives' do
    it 'should create a new incentive' do
      visit '/setup'
      fill_in 'incentive[code]', with: 'NEW_CODE'
      click_on 'Add'
      assert_text 'New incentive added'

      within '#incentives-list' do
        assert has_content? 'NEW_CODE'
      end
    end
  end

  describe 'updating_incentive' do
    let(:incentive) { create(:incentive, code: 'OLD_CODE')}

    setup do
      incentive ## create incentive beforehand as let doesnt run until called
    end
    
    it 'should_update_the_code' do
      visit '/setup'
      fill_in 'incentive_code', with: 'NEW_CODE'
      click_on 'Save'
      assert_text 'Successfully updated'
      assert_equal 'NEW_CODE', incentive.reload.code
    end
  end
end