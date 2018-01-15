require 'rails_helper'

RSpec.describe BathLog, type: :model do
  it_behaves_like 'have .model_name.human', '🛀'
  it_behaves_like 'have duration_min'
  it_behaves_like 'have started_at'

  describe '.baby_logs_sql' do
    let(:baby_id) { create(:baby).id }

    before do
      started_at = Time.zone.local(2017, 1, 2, 3, 4, 5)
      create(:bath_log, duration_min: 1, started_at: started_at)
      create(:bath_log, baby_id: baby_id, duration_min: 1, started_at: started_at)
    end

    specify do
      actual = ApplicationRecord.connection.exec_query(BathLog.baby_logs_sql("baby_id = #{baby_id}")).to_a
      expect(actual).to eq([{ "baby_id" => baby_id, "type" => "🛀", "started_at" => "2017-01-02 03:04:05", "text" => "1分" }])
    end
  end
end
