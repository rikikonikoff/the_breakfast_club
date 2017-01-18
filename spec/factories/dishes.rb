FactoryGirl.define do
  factory :dish do
    sequence(:creator_id) { |n| }
    sequence(:name) { |n| "Al's Pancake World fries #{n}" }
    description "This is a test dish"
  end
end
