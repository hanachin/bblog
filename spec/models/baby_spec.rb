require 'rails_helper'

RSpec.describe Baby, type: :model do
  describe 'validations' do
    subject { build(:baby) }

    it { is_expected.to validate_presence_of(:email).with_message('を入力してください') }
    it { is_expected.to validate_uniqueness_of(:email) }
  end
end
