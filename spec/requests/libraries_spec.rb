require 'rails_helper'

RSpec.describe '/libraries', type: :request do
  describe 'GET /index' do
    let!(:user) { create(:user) }
    let!(:purchase_recent) { create(:purchase_recent, user: user) }
    let!(:purchase_two_days_old) { create(:purchase_two_days_old, user: user) }
    let!(:purchase_one_day_old) { create(:purchase_one_day_old, user: user) }
    let!(:purchase_too_old) { create(:purchase_old, user: user) }
    it 'renders a successful response' do
      get user_libraries_url user_id: user.id, as: :json

      expect(response).to be_successful
    end

    it 'should return purchases by expiration date' do
      get user_libraries_url user_id: user.id, as: :json

      response_hash = JSON.parse(response.body)
      obtained_response = []
      response_hash['data'].each do |purchase|
        obtained_response << purchase['attributes']['created_at']
      end
      expect(obtained_response[0].to_time < obtained_response[1].to_time && obtained_response[1].to_time < obtained_response[2].to_time).to be true
    end

    it 'should not return purchases older than the date expiration' do
      get user_libraries_url user_id: user.id, as: :json

      response_hash = JSON.parse(response.body)
      obtained_response = []
      response_hash['data'].each do |purchase|
        obtained_response << purchase
      end
      expect(obtained_response.size).to eq(3)
    end
  end
end
