class SigninController < ApplicationController
  class SigninCode < ::SigninCode
    scope :not_expired, -> { where('created_at = updated_at') }
    alias expire touch
  end

  include BabySigninable
  include TodayBabyLogsPath

  alias _signin signin

  def signin
    baby = fetch_signin_code.baby
    expire_signin_code
    _signin(baby)
    redirect_to today_baby_logs_path
  rescue ActiveRecord::RecordNotFound => e
    @messages = { alert: 'ログインURLの有効期限が切れています。再度ログインをお願いします。' }
    render 'shared/messages', status: :not_found
  end

  private

  def code
    params.require(:code)
  end

  def expire_signin_code
    signin_code = fetch_signin_code
    signin_code.expire
  end

  def fetch_signin_code
    SigninCode.not_expired.find_by!(code: code)
  end
end
