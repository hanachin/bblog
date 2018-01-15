require 'rails_helper'

RSpec.describe SigninCode, type: :model do
  describe 'validations' do
    subject { build(:verification_code) }

    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_uniqueness_of(:code) }
  end
end
