class SigninMailer < ApplicationMailer
  def signin_code(signin_code)
    @code = signin_code.code
    mail(to: signin_code.baby.email, subject: 'bblogログインURL')
  end
end
