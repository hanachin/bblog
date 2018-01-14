require 'rails_helper'

RSpec.describe 'GET /verify/:code', type: :request do
  let(:today_baby_logs_path) { Date.current.yield_self { |d| "/baby/#{d.year}/#{d.month}/#{d.mday}" } }
  let(:verification_code) { create(:verification_code) }

  it "signin as baby and redirect to today's baby logs path" do
    expect { get verify_code_path(code: verification_code.code) }.to change { Baby.where(email: verification_code.email).count }.from(0).to(1).and change { verification_code.reload.updated_at }
    expect(response).to redirect_to(today_baby_logs_path)
    expect(session[:baby_id]).to eq(Baby.find_by(email: verification_code.email).id)
  end

  context "Can't use same code twice" do
    before { verification_code.touch }

    it 'raise ActiveRecord::RecordNotFound' do
      expect { get verify_code_path(code: verification_code.code) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  context "Can't create baby with same email address twice" do
    before { create(:baby, email: verification_code.email) }

    it 'raise ActiveRecord::RecordNotFound' do
      get verify_code_path(code: verification_code.code)
      expect(response.status).to eq(404)
      expect(response.body).to include('メールアドレスは既に登録されています')
    end
  end
end
