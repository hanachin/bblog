class BabyController < ApplicationController
  before_action do
    baby
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  private

  def baby
    Baby.find(session[:baby_id])
  end
end
