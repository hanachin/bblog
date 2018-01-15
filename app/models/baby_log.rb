class BabyLog
  extend ActiveModel::Naming
  extend ActiveModel::Translation

  class << self
    def baby_logs_sql(condition)
      <<~SQL
      (
        select
          baby_id,
          (baby_logs.type || ' ' || to_char(baby_logs.started_at, 'HH24:MI') || coalesce((' ' || baby_logs.text), '')) as text,
          baby_logs.started_at
        from (
          (#{BathLog.baby_logs_sql(condition)})
          union (#{BreastMilkLog.baby_logs_sql(condition)})
          union (#{MilkLog.baby_logs_sql(condition)})
          union (#{PeeLog.baby_logs_sql(condition)})
          union (#{PooLog.baby_logs_sql(condition)})
        ) as baby_logs
      )
      SQL
    end

    def to_json(condition)
      ApplicationRecord.connection.select_value(<<~SQL) || {}
      select json_object_agg(k, v)
      from (
        select started_at::date as k, json_agg(text ORDER BY started_at desc) as v
        from #{baby_logs_sql(condition)} as baby_logs
        group by started_at::date
      ) as j
      SQL
    end
  end
end
