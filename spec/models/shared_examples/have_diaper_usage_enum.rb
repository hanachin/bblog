RSpec.shared_examples 'have diaper_usage enum' do
  it { is_expected.to define_enum_for(:diaper_usage).with(%i(no_input little much)) }
end
