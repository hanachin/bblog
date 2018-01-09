require 'rails_helper'

RSpec.describe PooLog, type: :model do
  it_behaves_like 'have .model_name.human', '💩'
  it_behaves_like 'have diaper_usage enum'

  it { is_expected.to define_enum_for(:color).with(%i(no_input one two three four five six seven)) }
end
