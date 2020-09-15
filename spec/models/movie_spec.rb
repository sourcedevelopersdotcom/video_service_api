require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'should have structure restrictions' do
    it_behaves_like 'contentable'
    it_behaves_like 'title_plot'
    it { should have_db_index(:title).unique }
  end

  describe 'should have unique title' do
    before do
      @movie = create(:movie)
    end

    subject { @movie }
    it { should validate_uniqueness_of(:title).case_insensitive }
  end
end
