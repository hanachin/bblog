require 'securerandom'

FactoryBot.define do
  factory :signin_code do
    baby
    code { SecureRandom.uuid }
  end
end
