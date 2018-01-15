# Preview all emails at http://localhost:3000/rails/mailers/signin_mailer
class SigninMailerPreview < ActionMailer::Preview
  def signin_code
    baby = Baby.new(email: 'test@example.com')
    signin_code = SigninCode.new(code: 'sample', baby: baby)
    SigninMailer.signin_code(signin_code)
  end
end
