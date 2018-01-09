class PooLog < ApplicationRecord
  include DiaperUsage

  enum color: %i(no_input one two three four five six seven), _prefix: :color
end
