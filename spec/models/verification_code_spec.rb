require 'rails_helper'

RSpec.describe VerificationCode, type: :model do
  describe 'validations' do
    subject { build(:verification_code) }

    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_uniqueness_of(:code) }
    it { is_expected.to validate_presence_of(:email) }
  end
end
