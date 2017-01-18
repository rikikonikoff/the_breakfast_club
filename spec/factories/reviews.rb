FactoryGirl.define do
  factory :review do
    association :user, factory: :user
    association :dish, factory: :dish
    rating 5
    body "This is so yummy"
  end
end
