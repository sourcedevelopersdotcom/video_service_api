require 'rails_helper'

RSpec.describe LibrariesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/users/1/libraries').to route_to(controller: 'libraries', action: 'index', user_id: '1')
    end
  end
end
