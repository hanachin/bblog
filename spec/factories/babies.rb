FactoryBot.define do
  factory :baby do
    sequence(:email) { |n| "test#{n}@example.com" }
  end
end
