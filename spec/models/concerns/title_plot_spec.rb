shared_examples 'title_plot' do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:plot) }
end
