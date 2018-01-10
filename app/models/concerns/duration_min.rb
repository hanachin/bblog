module DurationMin
  extend ActiveSupport::Concern

  included do
    validates :duration_min, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true }
  end
end
