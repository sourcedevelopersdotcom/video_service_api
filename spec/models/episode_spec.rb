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
  end

  describe 'could have repeated pairs of title and number in different seasons' do
  end
end
