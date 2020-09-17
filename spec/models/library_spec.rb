require 'rails_helper'

RSpec.describe Library, type: :model do
  describe 'should not show purchases older than three days and be readonly' do
    before do
      @user = create(:user)
      @purchase_recent = create(:purchase_recent, user: @user)
      @purchase_old = create(:purchase_old, user: @user)
    end

    it 'should show only recent purchases' do
      expect(Library.all.length).to eq(1)
    end

    it 'should be read only' do
      expect(Library.first.readonly?).to eq(true)
    end
  end
end
