require 'rails_helper'

RSpec.describe BreastMilkLog, type: :model do
  it_behaves_like 'have .model_name.human', '🤱'
  it_behaves_like 'have duration_min'
  it_behaves_like 'have started_at'

  it { is_expected.to define_enum_for(:side).with(%i(no_input left right)) }

  describe '.baby_logs_sql' do
    before do
      started_at = Time.zone.local(2017, 1, 2, 3, 4, 5)
      BreastMilkLog.create!(duration_min: 1, side: :left, started_at: started_at)
    end

    specify do
      actual = ApplicationRecord.connection.exec_query(BreastMilkLog.baby_logs_sql).to_a
      expect(actual).to eq([{ "type" => "🤱", "started_at" => "2017-01-02 03:04:05", "text" => "左 1分" }])
    end
  end

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
