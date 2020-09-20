require 'rails_helper'

RSpec.describe Api::V1::ContentsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v1/contents').to route_to('api/v1/contents#index')
    end
  end
end
