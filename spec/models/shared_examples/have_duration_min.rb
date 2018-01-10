RSpec.shared_examples 'have duration_min' do
  it { is_expected.to validate_presence_of(:duration_min).with_message('を入力してください') }
  it { is_expected.to validate_numericality_of(:duration_min).only_integer.is_greater_than_or_equal_to(0).allow_nil.with_message(/^(?:は0以上の値にしてください|は整数で入力してください|は数値で入力してください)$/) }
end
