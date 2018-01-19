class PooLogsController < BabyController
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
    params.permit(:color, :diaper_usage, :started_at).merge(baby: baby).tap { |h| h[:color] = Integer(h[:color]) if h[:color] }
  end
end
