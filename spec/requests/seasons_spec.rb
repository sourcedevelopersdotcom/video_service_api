require 'rails_helper'

RSpec.describe '/seasons', type: :request do
  let!(:season1) { create(:season_new, title: 'S1', created_at: Time.now) }
  let!(:season2) { create(:season_new, title: 'S2', created_at: Time.now - 2.days) }
  let!(:season3) { create(:season_new, title: 'S3', created_at: Time.now - 1.days) }
  let!(:s1ep3) { create(:episode_new, title: 'S1E3', number: 3, season: season1) }
  let!(:s1ep1) { create(:episode_new, title: 'S1E1', number: 1, season: season1) }
  let!(:s1ep2) { create(:episode_new, title: 'S1E2', number: 2, season: season1) }
  let!(:s2ep3) { create(:episode_new, title: 'S1E3', number: 3, season: season2) }
  let!(:s2ep1) { create(:episode_new, title: 'S2E1', number: 1, season: season2) }
  let!(:s2ep2) { create(:episode_new, title: 'S2E2', number: 2, season: season2) }
  let!(:s3ep1) { create(:episode_new, title: 'S3E1', number: 1, season: season3) }
  let!(:s3ep2) { create(:episode_new, title: 'S3E2', number: 2, season: season3) }
  let!(:s3ep3) { create(:episode_new, title: 'S3E3', number: 3, season: season3) }
  describe 'GET /index' do
    it 'renders a successful response' do
      get seasons_url, as: :json
      expect(response).to be_successful
    end

    it 'returns results order by creation date' do
      get seasons_url, as: :json
      response_hash = JSON.parse(response.body)

      obtained_response = []
      response_hash['data'].each do |season|
        obtained_response << season['attributes']['created_at']
      end

      expect(obtained_response[0].to_time < obtained_response[1].to_time && obtained_response[1].to_time < obtained_response[2].to_time).to be true
    end

    it 'returns also episodes ordered by their numbers' do
      get seasons_url, as: :json
      response_hash = JSON.parse(response.body)
      obtained_response = []
      episodes = []
      response_hash['data'].each do |season|
        obtained_response << season['attributes']['episodes']
        obtained_response.each_with_index do |episode, index|
          episodes[index] = episode['data']
        end
      end

      episodes.each do |episodes_by_season|
        episodes_by_season.each do |episode|
          expect(episode['type']).to eq('episode')
        end

        expect(episodes_by_season[0]['attributes']['number'] < episodes_by_season[1]['attributes']['number'] && episodes_by_season[1]['attributes']['number'] < episodes_by_season[2]['attributes']['number'])
      end
    end
  end
end
