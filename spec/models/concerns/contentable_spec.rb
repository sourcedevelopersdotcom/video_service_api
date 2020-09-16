shared_examples 'contentable' do
  it { is_expected.to have_one(:content).dependent(:destroy) }
end
