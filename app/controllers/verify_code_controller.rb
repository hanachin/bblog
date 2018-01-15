class VerifyCodeController < ApplicationController
  class VerificationCode < ::VerificationCode
    scope :not_expired, -> { where('created_at = updated_at') }
    alias expire touch
  end

  include BabySigninable
  include TodayBabyLogsPath

  def verify
    ApplicationRecord.transaction do
      baby = create_baby
      signin(baby)
      expire_verification_code
    end
    redirect_to today_baby_logs_path
  rescue ActiveRecord::RecordNotFound => e
    @messages = { alert: '確認メールの有効期限が切れているか既に登録されているため登録を完了できませんでした。再度登録をお願いします。' }
    render 'shared/messages', status: :not_found
  rescue ActiveRecord::RecordInvalid => e
    @messages = { alert: e.record.errors.full_messages }
    render 'shared/messages', status: :not_found
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
end
