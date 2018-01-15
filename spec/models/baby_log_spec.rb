require 'rails_helper'

RSpec.describe BabyLog do
  it_behaves_like 'have .model_name.human', '👶'

  shared_context 'there are some baby logs' do
    let(:baby_id) { create(:baby).id }

    before do
      now = Time.zone.local(2017, 1, 2, 3, 4, 5)
      create(:bath_log, baby_id: baby_id, duration_min: 1, started_at: now)
      create(:breast_milk_log, baby_id: baby_id, duration_min: 2, started_at: 1.hour.since(now))
      create(:milk_log, baby_id: baby_id, duration_min: 3, milk_volume_ml: 120, started_at: 2.hours.since(now))
      create(:pee_log, baby_id: baby_id, started_at: 3.hours.since(now))
      create(:poo_log, baby_id: baby_id, started_at: 4.hours.since(now))
      create(:poo_log, baby_id: baby_id, started_at: 5.hours.since(now).yesterday)
    end
  end

  describe '.baby_logs_sql' do
    include_context 'there are some baby logs'

    specify do
      aggregate_failures do
        condition = "baby_id = #{baby_id}"
        result = ApplicationRecord.connection.exec_query("select * from (#{BabyLog.baby_logs_sql(condition)}) as t order by t.started_at desc").to_a
        actual = result.map { |r| r['text'] }
        expect(actual).to eq(["💩 07:04", "💧 06:04", "🍼 05:04 3分 120ml", "🤱 04:04 2分", "🛀 03:04 1分", "💩 08:04"])

        condition = "baby_id <> #{baby_id}"
        result = ApplicationRecord.connection.exec_query("select * from (#{BabyLog.baby_logs_sql(condition)}) as t order by t.started_at desc").to_a
        expect(result.size).to eq(0)
      end
    end
  end

  describe '.to_json' do
    include_context 'there are some baby logs'

    specify do
      aggregate_failures do
        condition = "baby_id = #{baby_id}"
        actual = JSON.parse(BabyLog.to_json(condition))
        expect(actual).to eq({ "2017-01-01" => ["💩 08:04"] , "2017-01-02" => ["💩 07:04", "💧 06:04", "🍼 05:04 3分 120ml", "🤱 04:04 2分", "🛀 03:04 1分"] })

        condition = "baby_id <> #{baby_id}"
        expect(BabyLog.to_json(condition)).to eq({})
      end
    end
  end
end
