class PeeLog < ApplicationRecord
  include HaveDiaperUsage
  include HaveStartedAt

  belongs_to :baby

  class << self
    def baby_logs_sql
      <<~SQL
      (
        select
          baby_id,
          '#{model_name.human}' as type,
          (#{table_name}.started_at at time zone 'UTC' at time zone '#{Time.zone.name}') as started_at,
          (#{diaper_usage_text_sql}) as text
        from #{table_name}
      )
    SQL
    end
  end
end
