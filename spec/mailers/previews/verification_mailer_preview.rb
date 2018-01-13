# Preview all emails at http://localhost:3000/rails/mailers/verification_mailer
class VerificationMailerPreview < ActionMailer::Preview
  def verification_code
    verification_code = VerificationCode.new(code: 'sample', email: 'test@example.com')
    VerificationMailer.verification_code(verification_code)
  end
end
