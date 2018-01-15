class SigninEmailsController < ApplicationController
  class SigninCode < ::SigninCode
    include AssignCodeBeforeValidation
  end

  def create
    send_signin_code
    head :created
  end

  private

  def email
    params.require(:email)
  end

  def send_signin_code
    return unless baby = Baby.find_by(email: email)

    signin_code = SigninCode.create!(baby: baby)
    SigninMailer.signin_code(signin_code).deliver_later
  end
end
