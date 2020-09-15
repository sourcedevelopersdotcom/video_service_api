require 'rails_helper'

RSpec.describe Season, type: :model do
  it_behaves_like 'contentable'
  it_behaves_like 'title_plot'

  it { should validate_presence_of(:number) }
end
