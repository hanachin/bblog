class MilkLog < ApplicationRecord
  include HaveDurationMin
  include HaveStartedAt

  belongs_to :baby

  validates :milk_volume_ml, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true }

  class << self
    def baby_logs_sql(condition)
      <<~SQL
      (
        select
          baby_id,
          '#{model_name.human}' as type,
          (#{table_name}.started_at at time zone 'UTC' at time zone '#{Time.zone.name}') as started_at,
          (#{table_name}.duration_min || '#{human_attribute_name(:duration_min)}' || ' ' || #{table_name}.milk_volume_ml || '#{human_attribute_name(:milk_volume_ml)}') as text
        from #{table_name}
        where #{condition}
      )
      SQL
    end
  end
end
