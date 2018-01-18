require 'rails_helper'

RSpec.describe 'POST /baby/bath_logs', type: :request do
  before {|ex| signin(create(:baby)) if ex.metadata[:signed_in] }

  it 'returns 201 for valid params', :signed_in do |ex|
    started_at = Time.zone.local(2017, 1, 2, 3, 4, 5)
    params = { duration_min: 1, started_at: started_at }
    expect { post baby_bath_logs_path, params: params }.to change { BathLog.where(params).count }.by(1)
    expect(response.status).to eq(201)

    h = JSON.parse(response.body)
    expect(h.fetch('duration_min')).to eq(1)
    expect(h.fetch('started_at')).to eq(started_at.as_json)
  end

  it 'returns 201 for valid params', :signed_in do
    expect { post baby_bath_logs_path }.not_to change { BathLog.count }
    expect(response.status).to eq(422)
    expect(response.body).to eq(%w(分を入力してください 開始時刻を入力してください).to_json)
  end

  it 'returns 302 for not signed in user' do
    expect { post baby_bath_logs_path }.not_to change { BathLog.count }
    expect(response).to redirect_to('/')
  end
end
