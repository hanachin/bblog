class SigninCode < ApplicationRecord
  belongs_to :baby

  validates :code, presence: true, uniqueness: true
end
