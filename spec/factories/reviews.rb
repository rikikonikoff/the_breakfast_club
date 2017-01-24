FactoryGirl.define do
  factory :review do
    association :reviewer, factory: :user
    association :dish, factory: :dish
    rating 5
    sequence(:body) { |n| "This is so yummy #{n}" }
  end
end
