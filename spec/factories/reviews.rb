FactoryGirl.define do
  factory :review do
    association :reviewer, factory: :user
    association :dish, factory: :dish
    rating 5
    body "This is so yummy"
  end
end
