require 'rails_helper'

RSpec.describe '/movies', type: :request do
  describe 'GET /index' do
    let!(:movie_older) { create(:movie, title: 'Older', created_at: Time.now - 2.minutes) }
    let!(:movie_newer) { create(:movie, title: 'Newer', created_at: Time.now - 1.minute) }
    let!(:movie_newest) { create(:movie, title: 'Newest', created_at: Time.now) }
    it 'renders a successful response' do
      get movies_url, as: :json
      expect(response).to be_successful
    end

    it 'returns results order by creation date' do
      get movies_url, as: :json
      response_hash = JSON.parse(response.body)

      expected_response = %w[Older Newer Newest]
      obtained_response = []
      response_hash['data'].each do |movie|
        obtained_response << movie['attributes']['title']
      end

      expect(expected_response).to eq obtained_response
    end
  end
end
