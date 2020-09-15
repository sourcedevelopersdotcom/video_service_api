require 'rails_helper'

RSpec.describe Content, type: :model do
  it { is_expected.to have_db_column(:contentable_id).of_type(:integer) }
  it { is_expected.to have_db_column(:contentable_type).of_type(:string) }
end
