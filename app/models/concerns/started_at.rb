module StartedAt
  extend ActiveSupport::Concern

  included do
    validates :started_at, presence: true
  end
end
