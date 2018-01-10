class PooLogsController < ApplicationController
  def create
    poo_log = PooLog.new(create_params)
    if poo_log.save
      render json: poo_log, status: :created
    else
      render json: poo_log.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def create_params
    params.permit(:color, :diaper_usage, :started_at)
  end
end
