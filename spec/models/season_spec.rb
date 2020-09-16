require 'rails_helper'

RSpec.describe Season, type: :model do
  describe 'should have structure restrictions' do
    it_behaves_like 'contentable'
    it_behaves_like 'title_plot'

    it { should have_many(:options) }
    it { should have_many(:episodes).dependent(:destroy).order(:number) }

    it { should validate_presence_of(:number) }
    it { should have_db_index(%i[number title]).unique }
  end

  describe 'should have unique pairs of title and number' do
    let(:season2) { build(:season) }
    before do
      @season = create(:season)
    end

    subject { @season }
    it { should validate_uniqueness_of(:title).scoped_to(:number).case_insensitive }

    it 'can\'t create duplicated seasson' do
      expect(@season).to be_valid
      expect { season2.save! }.to raise_error(
        ActiveRecord::RecordInvalid
      )
    end
  end

  describe 'could have different pairs of title and number' do
    let(:season) { create(:season) }
    let(:season2) { create(:season2) }

    it 'should create both seasons' do
      expect(season).to be_valid
      expect(season2).to be_valid
    end
  end
end
