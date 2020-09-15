require 'rails_helper'

RSpec.describe Episode, type: :model do
  it_behaves_like 'title_plot'

  it { should belong_to(:season) }

  it { should validate_presence_of(:number) }
end
