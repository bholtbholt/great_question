require 'test_helper'

class Api::RedemptionsControllerTest < ActionDispatch::IntegrationTest
  describe 'POST #create' do
    subject { post '/api/redemption' }

    it 'should redeem the first available incentive' do
      incentive = create(:incentive)
      subject

      assert_response :ok
      assert_equal 0, Incentive.available.size
      incentive.reload
      data = response.parsed_body
      assert_equal "Your code is: #{incentive.code}. Thanks for participating in our research!", data.fetch('message')
    end

    it 'should catch nil errors when no incentives are available' do
      subject
      assert_response :unprocessable_entity
      data = response.parsed_body
      assert_equal 'No incentives are available', data.fetch('message')
      assert data.fetch('errors')
    end
  end
end
