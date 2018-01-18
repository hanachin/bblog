class BreastMilkLogsController < BabyController
  def create
    breast_milk_log = BreastMilkLog.new(create_params)
    if breast_milk_log.save
      render json: breast_milk_log, status: :created
    else
      render json: breast_milk_log.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def create_params
    params.permit(:duration_min, :side, :started_at).merge(baby: baby)
  end
end
