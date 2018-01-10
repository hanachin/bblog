RSpec.shared_examples 'have started_at' do
  it { is_expected.to validate_presence_of(:started_at).with_message('を入力してください') }
end
