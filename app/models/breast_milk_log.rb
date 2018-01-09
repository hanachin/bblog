class BreastMilkLog < ApplicationRecord
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
  end
end
