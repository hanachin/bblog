class PeeLogsController < BabyController
  def create
    pee_log = PeeLog.new(create_params)
    if pee_log.save
      render json: pee_log, status: :created
    else
      render json: pee_log.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def create_params
    params.permit(:diaper_usage, :started_at).merge(baby: baby)
  end
end
