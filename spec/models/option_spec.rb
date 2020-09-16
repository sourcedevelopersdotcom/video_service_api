require 'rails_helper'

RSpec.describe Option, type: :model do
  describe 'should have structure restrictions' do
    it { should belong_to(:content) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:quality) }

    it { should have_one(:movie) }
    it { should have_one(:season) }
    it { should have_many(:purchases).dependent(:destroy) }
    it { should have_db_index(%i[content_id quality]).unique }
    subject { build(:option) }
    it { should validate_uniqueness_of(:price).scoped_to(:quality, :content_id) }
  end
end
