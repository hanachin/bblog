FactoryBot.define do
  factory :breast_milk_log do
    duration_min 10
    started_at { Time.current }
  end
end
