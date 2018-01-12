require 'rails_helper'

RSpec.describe 'POST /baby/breast_milk_logs', :pending, type: :request do
  it 'returns 201 for valid params' do
    started_at = Time.zone.local(2017, 1, 2, 3, 4, 5)
    params = { duration_min: 1, side: :left, started_at: started_at }
    expect { post baby_breast_milk_logs_path, params: params }.to change { BreastMilkLog.where(params).count }.by(1)
    expect(response.status).to eq(201)

    h = JSON.parse(response.body)
    expect(h.fetch('duration_min')).to eq(1)
    expect(h.fetch('side')).to eq('left')
    expect(h.fetch('started_at')).to eq(started_at.as_json)
  end

  it 'returns 201 for valid params' do
    expect { post baby_breast_milk_logs_path }.not_to change { BreastMilkLog.count }
    expect(response.status).to eq(422)
    expect(response.body).to eq(%w(分を入力してください 開始時刻を入力してください).to_json)
  end
end
