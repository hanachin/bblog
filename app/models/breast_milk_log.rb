class BreastMilkLog < ApplicationRecord
  enum side: %i(no_input left right), _suffix: :side
end
