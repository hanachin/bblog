require 'securerandom'

FactoryBot.define do
  factory :verification_code do
    code { SecureRandom.uuid }
    sequence(:email) { |n| "test#{n}@example.com" }
  end
end
