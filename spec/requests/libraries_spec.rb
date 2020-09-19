require 'rails_helper'

RSpec.describe '/libraries', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Library. As you add validations to Library, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # LibrariesController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Library.create! valid_attributes
      get libraries_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end
end
