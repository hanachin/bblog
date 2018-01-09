class MilkLog < ApplicationRecord
  class << self
    def baby_logs_sql
      <<~SQL
      (
        select
          '#{model_name.human}' as type,
          (#{table_name}.started_at at time zone 'UTC' at time zone '#{Time.zone.name}') as started_at,
          (#{table_name}.duration_min || '#{human_attribute_name(:duration_min)}' || ' ' || #{table_name}.milk_volume_ml || '#{human_attribute_name(:milk_volume_ml)}') as text
        from #{table_name}
      )
      SQL
    end
  end
end
