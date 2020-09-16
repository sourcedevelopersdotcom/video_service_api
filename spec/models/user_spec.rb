require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'should have structure restrictions' do
    it { should have_db_index(:email).unique }
  end

  describe 'should have unique email' do
    before do
      @user = create(:user)
    end

    subject { @user }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end
end
