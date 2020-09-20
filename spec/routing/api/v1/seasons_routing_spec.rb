require 'rails_helper'

RSpec.describe Api::V1::SeasonsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'api/v1/seasons').to route_to('api/v1/seasons#index')
    end
  end
end
