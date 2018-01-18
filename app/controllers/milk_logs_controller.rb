class MilkLogsController < BabyController
  def create
    milk_log = MilkLog.new(create_params)
    if milk_log.save
      render json: milk_log, status: :created
    else
      render json: milk_log.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def create_params
    params.permit(:duration_min, :milk_volume_ml, :started_at).merge(baby: baby)
  end
end
