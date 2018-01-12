FactoryBot.define do
  factory :poo_log do
    baby
    started_at { Time.current }
  end
end
