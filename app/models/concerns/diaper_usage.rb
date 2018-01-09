module DiaperUsage
  extend ActiveSupport::Concern

  included do
    enum diaper_usage: %i(no_input little much), _prefix: :diaper
  end

  class_methods do
    def diaper_usage_text_sql
      <<~SQL
      (
        CASE diaper_usage
        WHEN #{diaper_usages.fetch(:little)} THEN '#{human_attribute_name(:diaper_little)}'
        WHEN #{diaper_usages.fetch(:much)} THEN '#{human_attribute_name(:diaper_much)}'
        ELSE NULL
        END
      )
      SQL
    end
  end
end
