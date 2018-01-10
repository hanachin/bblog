class BathLogsController < ApplicationController
  def create
    bath_log = BathLog.new(create_params)
    if bath_log.save
      render json: bath_log, status: :created
    else
      render json: bath_log.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def create_params
    params.permit(:duration_min, :started_at)
  end
end
