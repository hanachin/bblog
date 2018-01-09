require 'rails_helper'

RSpec.describe PeeLog, type: :model do
  it_behaves_like 'have .model_name.human', '💧'
  it_behaves_like 'have diaper_usage enum'

  describe '.baby_logs_sql' do
    before do
      started_at = Time.zone.local(2017, 1, 2, 3, 4, 5)
      PeeLog.create!(diaper_usage: :much, started_at: started_at)
    end

    specify do
      actual = ApplicationRecord.connection.exec_query(PeeLog.baby_logs_sql).to_a
      expect(actual).to eq([{ "type" => "💧", "started_at" => "2017-01-02 03:04:05", "text" => "💧💧💧" }])
    end
  end

  describe '.diaper_usage_text_sql' do
    before do
      PeeLog.create!(started_at: Time.current, diaper_usage: :no_input)
      PeeLog.create!(started_at: Time.current, diaper_usage: :little)
      PeeLog.create!(started_at: Time.current, diaper_usage: :much)
    end

    specify do
      logs = PeeLog.select(:diaper_usage, "#{PeeLog.diaper_usage_text_sql} as diaper_usage_text").order(:id)
      actual = logs.inject([]) { |rs, r| rs << [r[:diaper_usage], r[:diaper_usage_text]] }
      expect(actual).to eq([["no_input", nil], %w(little 💧), %w(much 💧💧💧)])
    end
  end
end
