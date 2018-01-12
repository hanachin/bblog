FactoryBot.define do
  factory :pee_log do
    baby
    started_at { Time.current }
  end
end
