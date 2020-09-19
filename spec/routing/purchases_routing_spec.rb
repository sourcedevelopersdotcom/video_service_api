require 'rails_helper'

RSpec.describe PurchasesController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/purchases').to route_to('purchases#create')
    end
  end
end
