require 'securerandom'

class VerificationEmailsController < ApplicationController
  class VerificationCode < ::VerificationCode
    include AssignCodeBeforeValidation
  end

  def create
    verification_code = VerificationCode.create!(email: email)
    VerificationMailer.verification_code(verification_code).deliver_later
    head :created
  end

  private

  def email
    params.require(:email)
  end
end
