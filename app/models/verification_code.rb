class VerificationCode < ApplicationRecord
  validates :code, presence: true, uniqueness: true
  validates :email, presence: true
end
