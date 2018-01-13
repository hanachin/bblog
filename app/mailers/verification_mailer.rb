class VerificationMailer < ApplicationMailer
  def verification_code(verification_code)
    @code = verification_code.code
    mail(to: verification_code.email, subject: 'bblog登録URL')
  end
end
