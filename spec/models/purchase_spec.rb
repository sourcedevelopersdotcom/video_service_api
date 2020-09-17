require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe 'should have structure restrictions' do
    it { should belong_to(:user) }
    it { should belong_to(:option) }
  end
end
