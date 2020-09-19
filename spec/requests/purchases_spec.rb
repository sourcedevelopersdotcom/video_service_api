require 'rails_helper'

RSpec.describe '/purchases', type: :request do
  let(:season) { create(:season_new, title: 'Season') }
  let(:movie) { create(:movie_new, title: 'Movie') }
  let(:content1) { create(:content, :for_season, contentable: season) }
  let(:content2) { create(:content, :for_movie, contentable: movie) }
  let(:option1) { create(:option_new, :for_hd, content: content1) }
  let(:option2) { create(:option_new, :for_sd, content: content1) }
  let(:user) { create(:user) }

  let(:valid_attributes) do
    { user_id: user.id.to_s, option_id: option1.id.to_s }
  end

  let(:invalid_attributes) do
    { user_id: user.id.to_s, option_id: option1.id.to_s }
  end

  describe 'POST /create' do
    context 'with valid parameters although a there is a existing purchase for that content but expired' do
      let!(:purchase) { create(:purchase_old, user: user, option: option1) }
      it 'creates a new Purchase' do
        expect do
          post purchases_url,
               params: valid_attributes, as: :json
        end.to change(Purchase, :count).by(1)
      end

      it 'renders a JSON response with the new purchase' do
        post purchases_url,
             params: valid_attributes, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters because already exists that content in the user library' do
      let!(:purchase) { create(:purchase_one_day_old, user: user, option: option1) }
      it 'does not create a new Purchase' do
        expect do
          post purchases_url,
               params: invalid_attributes, as: :json
        end.to change(Purchase, :count).by(0)
      end

      it 'renders a JSON response with errors for the new purchase' do
        post purchases_url,
             params: invalid_attributes, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end
end
