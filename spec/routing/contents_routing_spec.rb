require 'rails_helper'

RSpec.describe ContentsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/contents').to route_to('contents#index')
    end
  end
end
