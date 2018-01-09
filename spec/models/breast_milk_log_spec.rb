require 'rails_helper'

RSpec.describe BreastMilkLog, type: :model do
  it_behaves_like 'have .model_name.human', '🤱'
  it { is_expected.to define_enum_for(:side).with(%i(no_input left right)) }

  describe '.side_text_sql' do
    before do
      BreastMilkLog.create!(duration_min: 1, started_at: Time.current, side: :no_input)
      BreastMilkLog.create!(duration_min: 1, started_at: Time.current, side: :left)
      BreastMilkLog.create!(duration_min: 1, started_at: Time.current, side: :right)
    end

    specify do
      logs = BreastMilkLog.select(:id, :side, "#{BreastMilkLog.side_text_sql} as side_text").order(:id)
      actual = logs.inject([]) { |rs, r| rs << [r[:side], r[:side_text]] }
      expect(actual).to eq([["no_input", nil], %w(left 左), %w(right 右)])
    end
  end
end
