require 'rails_helper'

RSpec.describe '/contents', type: :request do
  describe 'GET /index' do
    it 'renders a successful response' do
      get contents_url, as: :json
      expect(response).to be_successful
    end
  end
end
