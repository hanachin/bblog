class BabyLogsController < BabyController
  class Baby < ::Baby
    def baby_logs_json(date)
      BabyLog.to_json(baby_logs_condition(date))
    end

    private

    def baby_condition
      "baby_id = #{id}"
    end

    def baby_logs_condition(date)
      "#{baby_condition} and #{date_condition(date)}"
    end

    def date_condition(date)
      "started_at between '#{3.hours.ago(date.beginning_of_day).to_s(:db)}' and '#{date.end_of_day.to_s(:db)}'"
    end
  end

  def index
    respond_to do |f|
      f.html
      f.json { render json: baby.baby_logs_json(date) }
    end
  end

  private

  def baby
    Baby.find(super.id)
  end

  def date
    Time.zone.local(params[:year].to_i, params[:month].to_i, params[:mday].to_i)
  end
end
