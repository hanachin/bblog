require 'rails_helper'

RSpec.describe BreastMilkLog, type: :model do
  it_behaves_like 'have .model_name.human', '🤱'
  it { is_expected.to define_enum_for(:side).with(%i(no_input left right)) }
end
