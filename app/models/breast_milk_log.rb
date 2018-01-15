class BreastMilkLog < ApplicationRecord
  include HaveDurationMin
  include HaveStartedAt

  belongs_to :baby

  enum side: %i(no_input left right), _suffix: :side

  class << self
    def side_text_sql
      <<~SQL
      (
        CASE side
        WHEN #{sides.fetch(:left)} THEN '#{human_attribute_name(:left_side)}'
        WHEN #{sides.fetch(:right)} THEN '#{human_attribute_name(:right_side)}'
        ELSE NULL
        END
      )
      SQL
    end

    def baby_logs_sql
      <<~SQL
      (
        select
          baby_id,
          '#{model_name.human}' as type,
          (#{table_name}.started_at at time zone 'UTC' at time zone '#{Time.zone.name}') as started_at,
          (coalesce(((#{side_text_sql}) || ' '), '') || #{table_name}.duration_min || '#{human_attribute_name(:duration_min)}') as text
        from #{table_name}
      )
      SQL
    end
  end
end
