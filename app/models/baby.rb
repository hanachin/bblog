class Baby < ApplicationRecord
  validates :email, presence: true, uniqueness: true
end
