FactoryBot.define do
  factory :milk_log do
    baby
    duration_min 10
    milk_volume_ml 120
    started_at { Time.current }
  end
end
