require 'rails_helper'

RSpec.describe Content, type: :model do
  let(:content) { create(:content) }
  it { is_expected.to have_db_column(:contentable_id).of_type(:integer) }
  it { is_expected.to have_db_column(:contentable_type).of_type(:string) }
  it { should have_many(:options) }
  subject { build(:content) }
  it { should validate_uniqueness_of(:contentable_id).scoped_to(:contentable_type) }
end
