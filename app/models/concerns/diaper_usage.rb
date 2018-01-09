module DiaperUsage
  extend ActiveSupport::Concern

  included do
    enum diaper_usage: %i(no_input little much), _prefix: :diaper
  end
end
