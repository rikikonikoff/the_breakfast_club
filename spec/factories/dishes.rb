FactoryGirl.define do
  factory :dish do
    creator_id 1
    sequence(:name) { |n| "Al's Pancake World fries #{n}" }
    description "This is a test dish"
  end
end
