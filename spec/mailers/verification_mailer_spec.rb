require 'rails_helper'

RSpec.describe VerificationMailer, type: :mailer do
  describe '#verification_code' do
    let(:verification_code) { create(:verification_code) }

    let(:mail) { VerificationMailer.verification_code(verification_code) }

    it 'renders the headers' do
      aggregate_failures do
        expect(mail.subject).to eq('bblog登録URL')
        expect(mail.to).to eq([verification_code.email])
        expect(mail.from).to eq(%w(noreply@bblog.hanach.in))
      end
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match(verification_code.code)
    end
  end
end
