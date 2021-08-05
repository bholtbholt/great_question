require "application_system_test_case"

class ResearcherTest < ApplicationSystemTestCase
  describe 'viewing_incentive' do
    setup do
      create(:incentive, code: 'COUPON_123')
    end

    it 'should_show_the_current_coupon' do
      visit '/setup'

      within '#incentives-list' do
        assert has_content? 'COUPON_123'
      end
    end
  end

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
    
    it 'should update the incentive' do
      visit '/setup'
      click_on 'edit'

      within "#incentive-form-#{incentive.id}" do
        fill_in 'incentive[code]', with: 'NEW_CODE'
        check 'incentive[redeemed]'
        click_on 'Update'
      end

      within "#incentive-#{incentive.id}" do
        assert has_content? 'NEW_CODE'
        assert has_content? 'redeemed'
      end

      incentive.reload
      assert_equal 'NEW_CODE', incentive.code
      assert incentive.redeemed
    end
  end
end
