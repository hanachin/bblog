require 'rails_helper'

RSpec.describe Baby, type: :model do
  it { is_expected.to validate_presence_of(:email).with_message('を入力してください') }
end
