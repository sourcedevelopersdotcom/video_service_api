require 'rails_helper'

RSpec.describe Api::V1::LibrariesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'api/v1/users/1/libraries').to route_to(controller: 'api/v1/libraries', action: 'index', user_id: '1')
    end
  end
end
