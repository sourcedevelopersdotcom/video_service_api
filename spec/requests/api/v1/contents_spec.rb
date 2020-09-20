require 'rails_helper'

RSpec.describe Api::V1::ContentsController, type: :request do
  let!(:movie1) { create(:movie_new, title: 'Movie 1', created_at: Time.now) }
  let!(:season1) { create(:season_new, title: 'Season 1',  created_at: Time.now - 1.days) }
  let!(:season2) { create(:season_new, title: 'Season 2',  created_at: Time.now - 2.days) }
  let!(:movie2) { create(:movie_new, title: 'Movie 2', created_at: Time.now - 3.days) }
  let!(:content1) { create(:content, :for_movie, contentable: movie1) }
  let!(:content2) { create(:content, :for_movie, contentable: movie2) }
  let!(:content3) { create(:content, :for_season, contentable: season1) }
  let!(:content4) { create(:content, :for_season, contentable: season2) }
  describe 'GET /index' do
    it 'renders a successful response' do
      get api_v1_contents_url, as: :json
      expect(response).to be_successful
    end

    it 'returns results order by creation date' do
      get api_v1_contents_url, as: :json
      response_hash = JSON.parse(response.body)
      obtained_response_times = []
      obtained_response_names = []
      response_hash['data'].each do |content|
        # puts content
        obtained_response_times << content['attributes']['contentable']['data']['attributes']['created_at']
        obtained_response_names << content['attributes']['contentable']['data']['attributes']['title']
      end

      expect(obtained_response_times[0].to_time < obtained_response_times[1].to_time && obtained_response_times[1].to_time < obtained_response_times[2].to_time).to be true
      expect(obtained_response_names).to eq ['Movie 2', 'Season 2', 'Season 1', 'Movie 1']
    end
  end
end
