require 'rails_helper'

RSpec.describe '/purchases', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Purchase. As you add validations to Purchase, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Purchase' do
        expect do
          post purchases_url,
               params: { purchase: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Purchase, :count).by(1)
      end

      it 'renders a JSON response with the new purchase' do
        post purchases_url,
             params: { purchase: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Purchase' do
        expect do
          post purchases_url,
               params: { purchase: invalid_attributes }, as: :json
        end.to change(Purchase, :count).by(0)
      end

      it 'renders a JSON response with errors for the new purchase' do
        post purchases_url,
             params: { purchase: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end
end
