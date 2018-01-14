class VerifyCodeController < ApplicationController
  class VerificationCode < ::VerificationCode
    scope :not_expired, -> { where('created_at = updated_at') }
    alias expire touch
  end


  def verify
    ApplicationRecord.transaction do
      baby = create_baby
      signin(baby)
      expire_verification_code
    end
    redirect_to today_baby_logs_path
  end

  private

  def code
    params.require(:code)
  end

  def create_baby
    verification_code = fetch_verification_code
    Baby.create!(email: verification_code.email)
  end

  def expire_verification_code
    verification_code = fetch_verification_code
    verification_code.expire
  end

  def fetch_verification_code
    VerificationCode.not_expired.find_by!(code: code)
  end

  def signin(baby)
    session[:baby_id] = baby.id
  end

  def today_baby_logs_path
    date = Date.current
    baby_logs_path(year: date.year, month: date.month, mday: date.mday)
  end
end
