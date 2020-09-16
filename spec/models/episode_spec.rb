require 'rails_helper'

RSpec.describe Episode, type: :model do
  describe 'should have structure restrictions' do
    it_behaves_like 'title_plot'
    it { should validate_presence_of(:number) }

    it { should belong_to(:season) }
    it { should have_db_index(%i[season_id number]).unique }
    it { should have_db_index(%i[season_id title]).unique }
  end

  describe 'should have unique pairs of title and number inside the same season' do
    before do
      @season = create(:season)
      @episode = create(:episode, season: @season)
    end

    let(:episode2) { create(:episode, season: @season) }
    let(:episode_duplicated_name) { create(:episode, number: 2, season: @season) }
    let(:episode_duplicated_number) { create(:episode, title: 'Summer is coming', season: @season) }

    subject { @episode }
    it { should validate_uniqueness_of(:title).scoped_to(:season_id).case_insensitive }
    it { should validate_uniqueness_of(:number).scoped_to(:season_id).case_insensitive }

    it 'can\'t create duplicated episode in a season' do
      expect(@episode).to be_valid
      expect { episode2.save! }.to raise_error(
        ActiveRecord::RecordInvalid
      )
    end

    it 'can\'t have same name in a season' do
      expect(@episode).to be_valid
      expect { episode_duplicated_name.save! }.to raise_error(
        ActiveRecord::RecordInvalid
      )
    end

    it 'can\'t have same number in a season' do
      expect(@episode).to be_valid
      expect { episode_duplicated_number.save! }.to raise_error(
        ActiveRecord::RecordInvalid
      )
    end
  end

  describe 'could have repeated pairs of title and number in different seasons' do
    let(:season) { create(:season) }
    let(:season2) { create(:season2) }
    let(:episode_season1) { create(:episode, season: season) }
    let(:episode_season2) { create(:episode, season: season2) }

    it 'can create same episode in different seasons' do
      expect(episode_season1).to be_valid
      expect(episode_season2).to be_valid
    end
  end
end
