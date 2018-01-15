require 'rails_helper'

RSpec.describe 'POST /signin_emails' do
  it 'returns 201' do
    baby = create(:baby, email: 'test@example.com')
    expect { post signin_emails_path, params: { email: 'test@example.com' } }.to change { SigninCode.where(baby: baby).count }.and change { SigninMailer.deliveries.size }.by(1)
    expect(SigninMailer.deliveries.last.to).to eq(['test@example.com'])
    expect(response.status).to eq(201)
  end

  it 'returns 201 for not exist email' do
    expect { post signin_emails_path, params: { email: 'test@example.com' } }.to change { SigninCode.count }.by(0).and change { SigninMailer.deliveries.size }.by(0)
    expect(response.status).to eq(201)
  end

  it 'returns 422 for invalid params' do
    expect { post signin_emails_path }.to raise_error(ActionController::ParameterMissing)
  end
end
