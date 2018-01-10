require 'rails_helper'

RSpec.describe MilkLog, type: :model do
  it_behaves_like 'have .model_name.human', '🍼'
  it_behaves_like 'have duration_min'
  it_behaves_like 'have started_at'

  describe '.baby_logs_sql' do
    before do
      started_at = Time.zone.local(2017, 1, 2, 3, 4, 5)
      MilkLog.create!(duration_min: 1, milk_volume_ml: 100, started_at: started_at)
    end

    specify do
      actual = ApplicationRecord.connection.exec_query(MilkLog.baby_logs_sql).to_a
      expect(actual).to eq([{ "type" => "🍼", "started_at" => "2017-01-02 03:04:05", "text" => "1分 100ml" }])
    end
  end
end
