FactoryBot.define do
  factory :bath_log do
    duration_min 10
    started_at { Time.current }
  end
end
