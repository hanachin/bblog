class BabyLog
  extend ActiveModel::Naming
  extend ActiveModel::Translation

  class << self
    def baby_logs_sql
      <<~SQL
      (
        select
          (baby_logs.type || ' ' || to_char(baby_logs.started_at, 'HH24:MI') || coalesce((' ' || baby_logs.text), '')) as text, baby_logs.started_at
        from (
          (#{BathLog.baby_logs_sql})
          union (#{BreastMilkLog.baby_logs_sql})
          union (#{MilkLog.baby_logs_sql})
          union (#{PeeLog.baby_logs_sql})
          union (#{PooLog.baby_logs_sql})
        ) as baby_logs
      )
      SQL
    end

    def to_json
      ApplicationRecord.connection.select_value(<<~SQL)
      select
        json_build_object(started_at::date, array_to_json(array_agg(text ORDER BY started_at desc)))
      from #{baby_logs_sql} as baby_logs
      group by started_at::date;
      SQL
    end
  end
end
