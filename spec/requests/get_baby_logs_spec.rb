require 'rails_helper'

RSpec.describe 'GET /baby/:year/:month/:mday', type: :request do
  let(:baby) { create(:baby) }

  before {|ex| signin(baby) if ex.metadata[:signed_in] }

  it 'redirect to root_path' do
    get baby_logs_path(year: 2018, month: 1, mday: 2)
    redirect_to root_path
  end

  context 'when baby logs are empty', :signed_in do
    it 'returns empty baby logs' do
      get baby_logs_path(year: 2018, month: 1, mday: 2, format: :json)
      expect(response.body).to eq("{}")
    end
  end

  context 'when there are some baby logs', :signed_in do
    before do
      # yesterday baby logs
      create(:poo_log, baby_id: baby.id, started_at: Time.zone.local(2018, 1, 1, 20, 59, 59))
      create(:poo_log, baby_id: baby.id, started_at: Time.zone.local(2018, 1, 1, 21, 0, 0))

      # current day baby logs
      time = Time.zone.local(2018, 1, 2, 3, 4, 5)
      create(:bath_log, baby: baby, duration_min: 1, started_at: time)
      create(:breast_milk_log, baby: baby, duration_min: 2, started_at: 1.hour.since(time))
      create(:milk_log, baby: baby, duration_min: 3, milk_volume_ml: 120, started_at: 2.hours.since(time))
      create(:pee_log, baby: baby, started_at: 3.hours.since(time))
      create(:poo_log, baby: baby, started_at: 4.hours.since(time))

      # other baby's log
      create(:bath_log, duration_min: 1, started_at: time)
    end


    it 'returns all kinds of baby logs from yesterday 21:00 to end of today' do
      get baby_logs_path(year: 2018, month: 1, mday: 2, format: :json)
      baby_logs = JSON.parse(response.body)
      expect(baby_logs).to eq({ "2018-01-02" => ["💩 07:04", "💧 06:04", "🍼 05:04 3分 120ml", "🤱 04:04 2分", "🛀 03:04 1分"], "2018-01-01" => ["💩 21:00"] })
    end
  end
end
