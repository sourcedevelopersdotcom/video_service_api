shared_examples 'contentable' do
  it { is_expected.to have_many(:contents) }
end
