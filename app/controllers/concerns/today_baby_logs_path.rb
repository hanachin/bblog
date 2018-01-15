module TodayBabyLogsPath
  def today_baby_logs_path
    date = Date.current
    baby_logs_path(year: date.year, month: date.month, mday: date.mday)
  end
end
