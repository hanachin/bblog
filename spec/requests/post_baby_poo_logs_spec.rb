require 'rails_helper'

RSpec.describe 'POST /baby/poo_logs', :pending, type: :request do
  it 'returns 201 for valid params' do
    started_at = Time.zone.local(2017, 1, 2, 3, 4, 5)
    params = { color: :five, diaper_usage: :much, started_at: started_at }
    expect { post baby_poo_logs_path, params: params }.to change { PooLog.where(params).count }.by(1)
    expect(response.status).to eq(201)

    h = JSON.parse(response.body)
    expect(h.fetch('color')).to eq('five')
    expect(h.fetch('diaper_usage')).to eq('much')
    expect(h.fetch('started_at')).to eq(started_at.as_json)
  end

  it 'returns 201 for valid params' do
    expect { post baby_poo_logs_path }.not_to change { PooLog.count }
    expect(response.status).to eq(422)
    expect(response.body).to eq(%w(開始時刻を入力してください).to_json)
  end
end
