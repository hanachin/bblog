require 'rails_helper'

RSpec.describe 'GET /signin/:code', type: :request do
  let(:today_baby_logs_path) { Date.current.yield_self { |d| "/baby/#{d.year}/#{d.month}/#{d.mday}" } }
  let(:signin_code) { create(:signin_code) }

  it "signin as baby and redirect to today's baby logs path" do
    expect { get signin_path(code: signin_code.code) }.to change { signin_code.reload.updated_at }
    expect(response).to redirect_to(today_baby_logs_path)
    expect(session[:baby_id]).to eq(signin_code.baby_id)
  end

  context "Can't use same code twice" do
    before { signin_code.touch }

    it 'raise ActiveRecord::RecordNotFound' do
      get signin_path(code: signin_code.code)
      expect(response.status).to eq(404)
      expect(response.body).to include('ログインURLの有効期限が切れています。再度ログインをお願いします。')
    end
  end
end
