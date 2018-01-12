FactoryBot.define do
  factory :bath_log do
    baby
    duration_min 10
    started_at { Time.current }
  end
end
