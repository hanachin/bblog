require "rails_helper"

RSpec.describe SigninMailer, type: :mailer do
  describe '#signin_code' do
    let(:signin_code) { create(:signin_code) }

    let(:mail) { SigninMailer.signin_code(signin_code) }

    it 'renders the headers' do
      aggregate_failures do
        expect(mail.subject).to eq('bblogログインURL')
        expect(mail.to).to eq([signin_code.baby.email])
        expect(mail.from).to eq(%w(noreply@bblog.hanach.in))
      end
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match(signin_code.code)
    end
  end
end
