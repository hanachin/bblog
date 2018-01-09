require 'rails_helper'

RSpec.describe PooLog, type: :model do
  it_behaves_like 'have .model_name.human', '💩'
  it_behaves_like 'have diaper_usage enum'

  it { is_expected.to define_enum_for(:color).with(%i(no_input one two three four five six seven)) }

  describe '.baby_logs_sql' do
    before do
      started_at = Time.zone.local(2017, 1, 2, 3, 4, 5)
      PooLog.create!(diaper_usage: :little, started_at: started_at)
    end

    specify do
      actual = ApplicationRecord.connection.exec_query(PooLog.baby_logs_sql).to_a
      expect(actual).to eq([{ "type" => "💩", "started_at" => "2017-01-02 03:04:05", "text" => "💩" }])
    end
  end

  describe '.diaper_usage_text_sql' do
    before do
      PooLog.create!(started_at: Time.current, diaper_usage: :no_input)
      PooLog.create!(started_at: Time.current, diaper_usage: :little)
      PooLog.create!(started_at: Time.current, diaper_usage: :much)
    end

    specify do
      logs = PooLog.select(:diaper_usage, "#{PooLog.diaper_usage_text_sql} as diaper_usage_text").order(:id)
      actual = logs.inject([]) { |rs, r| rs << [r[:diaper_usage], r[:diaper_usage_text]] }
      expect(actual).to eq([["no_input", nil], %w(little 💩), %w(much 💩💩💩)])
    end
  end
end
