require 'rails_helper'

RSpec.describe Movie, type: :model do
  it_behaves_like 'contentable'
  it_behaves_like 'title_plot'
end
