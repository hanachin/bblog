require 'rails_helper'

RSpec.describe 'POST /baby/poo_logs', type: :request do
  before {|ex| signin(create(:baby)) if ex.metadata[:signed_in] }

  it 'returns 201 for valid params', :signed_in do
    started_at = Time.zone.local(2017, 1, 2, 3, 4, 5)
    params = { color: :five, diaper_usage: :much, started_at: started_at }
    expect { post baby_poo_logs_path, params: params }.to change { PooLog.where(params).count }.by(1)
    expect(response.status).to eq(201)

    h = JSON.parse(response.body)
    expect(h.fetch('color')).to eq('five')
    expect(h.fetch('diaper_usage')).to eq('much')
    expect(h.fetch('started_at')).to eq(started_at.as_json)
  end

  it 'returns 201 for valid params', :signed_in do
    expect { post baby_poo_logs_path }.not_to change { PooLog.count }
    expect(response.status).to eq(422)
    expect(response.body).to eq(%w(開始時刻を入力してください).to_json)
  end

  it 'returns 302 for not signed in user' do
    expect { post baby_bath_logs_path }.not_to change { BathLog.count }
    expect(response).to redirect_to('/')
  end
end
