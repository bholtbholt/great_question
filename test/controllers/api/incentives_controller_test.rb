require 'test_helper'

class Api::IncentivesControllerTest < ActionDispatch::IntegrationTest
  describe 'GET #index' do
    subject { get '/api/incentives' }

    setup do
      create(:incentive, code: 'COUPON!')
    end

    it 'should return all incentives' do
      subject
      assert_response :ok
      data = response.parsed_body
      assert_equal 1, data.size
      assert_equal 'COUPON!', data[0]['code']
      assert data[0].key? 'id'
    end
  end

  describe 'POST #create' do
    subject { post '/api/incentives', params: { incentive: params } }
    let(:params) { { code: 'PIZZA_88' } }

    it 'should create a new incentive' do
      assert_changes -> { Incentive.all.size }, from: 0, to: 1 do
        subject
      end

      assert_response :success
      data = response.parsed_body
      assert_equal 'PIZZA_88', data.dig('incentive', 'code')
    end

    it 'should return an error message' do
      create(:incentive, code: 'PIZZA_88')
      subject

      assert_response :unprocessable_entity
      data = response.parsed_body
      assert_equal 'Code has already been taken', data.fetch('message')
    end
  end

  describe 'PUT #update' do
    subject { put "/api/incentives/#{incentive.id}", params: { incentive: params } }

    let(:incentive) { create(:incentive) }
    let(:params) { { code: 'FOOBAR' } }

    it 'should update the incentive' do
      subject
      assert_response :success
      assert_equal 'FOOBAR', incentive.reload.code
    end
  end
end
