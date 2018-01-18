require 'rails_helper'

RSpec.describe 'POST /signin_or_signup_emails' do
  it 'returns 201 and send verification code' do
    expect { post signin_or_signup_emails_path, params: { email: 'test@example.com' } }.to change { VerificationCode.where(email: 'test@example.com').count }.and change { VerificationMailer.deliveries.size }.by(1)
    expect(VerificationMailer.deliveries.last.to).to eq(['test@example.com'])
    expect(response.status).to eq(201)
  end

  it 'returns 201 and send signin code' do
    baby = create(:baby, email: 'test@example.com')
    expect { post signin_or_signup_emails_path, params: { email: 'test@example.com' } }.to change { SigninCode.where(baby: baby).count }.and change { SigninMailer.deliveries.size }.by(1)
    expect(SigninMailer.deliveries.last.to).to eq(['test@example.com'])
    expect(response.status).to eq(201)
  end

  it 'returns 422 for invalid params' do
    expect { post signin_or_signup_emails_path }.to raise_error(ActionController::ParameterMissing)
  end
end
