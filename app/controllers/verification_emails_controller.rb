require 'securerandom'

class VerificationEmailsController < ApplicationController
  class VerificationCode < ::VerificationCode
    before_validation do
      self.code = SecureRandom.uuid
    end
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
