require 'rails_helper'

RSpec.describe 'POST /verification_emails' do
  it 'returns 201' do
    expect { post verification_emails_path, params: { email: 'test@example.com' } }.to change { VerificationCode.where(email: 'test@example.com').count }.and change { VerificationMailer.deliveries.size }.by(1)
    expect(VerificationMailer.deliveries.last.to).to eq(['test@example.com'])
    expect(response.status).to eq(201)
  end

  it 'returns 422 for invalid params' do
    expect { post verification_emails_path }.to raise_error(ActionController::ParameterMissing)
  end
end
