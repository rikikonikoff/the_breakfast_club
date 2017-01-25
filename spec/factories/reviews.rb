FactoryGirl.define do
  factory :review do
    association :reviewer, factory: :user
    association :dish, factory: :dish
    rating 3
    sequence(:body) { |n| "This is so yummy #{n}" }
    sum_votes 0
  end
end
