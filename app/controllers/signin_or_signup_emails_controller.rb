require 'securerandom'

class SigninOrSignupEmailsController < ApplicationController
  class SigninCode < ::SigninCode
    include AssignCodeBeforeValidation
  end

  class VerificationCode < ::VerificationCode
    include AssignCodeBeforeValidation
  end

  def create
    if baby
      send_signin_code
    else
      send_verification_code
    end
    head :created
  end

  private

  def baby
    Baby.find_by(email: email)
  end

  def email
    params.require(:email)
  end

  def send_signin_code
    signin_code = SigninCode.create!(baby: baby)
    SigninMailer.signin_code(signin_code).deliver_later
  end

  def send_verification_code
    verification_code = VerificationCode.create!(email: email)
    VerificationMailer.verification_code(verification_code).deliver_later
  end
end
