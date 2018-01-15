require 'rails_helper'

RSpec.describe PooLog, type: :model do
  it_behaves_like 'have .model_name.human', '💩'
  it_behaves_like 'have diaper_usage enum'
  it_behaves_like 'have started_at'

  it { is_expected.to define_enum_for(:color).with(%i(no_input one two three four five six seven)) }

  describe '.baby_logs_sql' do
    let(:baby_id) { create(:baby).id }

    before do
      started_at = Time.zone.local(2017, 1, 2, 3, 4, 5)
      create(:poo_log, diaper_usage: :little, started_at: started_at)
      create(:poo_log, baby_id: baby_id, diaper_usage: :little, started_at: started_at)
    end

    specify do
      actual = ApplicationRecord.connection.exec_query(PooLog.baby_logs_sql("baby_id = #{baby_id}")).to_a
      expect(actual).to eq([{ "baby_id" => baby_id, "type" => "💩", "started_at" => "2017-01-02 03:04:05", "text" => "💩" }])
    end
  end

  describe '.diaper_usage_text_sql' do
    before do
      create(:poo_log, started_at: Time.current, diaper_usage: :no_input)
      create(:poo_log, started_at: Time.current, diaper_usage: :little)
      create(:poo_log, started_at: Time.current, diaper_usage: :much)
    end

    specify do
      logs = PooLog.select(:diaper_usage, "#{PooLog.diaper_usage_text_sql} as diaper_usage_text").order(:id)
      actual = logs.inject([]) { |rs, r| rs << [r[:diaper_usage], r[:diaper_usage_text]] }
      expect(actual).to eq([["no_input", nil], %w(little 💩), %w(much 💩💩💩)])
    end
  end
end
