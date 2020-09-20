require 'rails_helper'

RSpec.describe Api::V1::PurchasesController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: 'api/v1/purchases').to route_to('api/v1/purchases#create')
    end
  end
end
