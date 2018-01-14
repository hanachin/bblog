class Baby < ApplicationRecord
  validates :email, presence: true, uniqueness: { message: 'は既に登録されています' }
end
