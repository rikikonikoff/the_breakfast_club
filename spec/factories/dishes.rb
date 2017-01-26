FactoryGirl.define do
  factory :dish do
    association :creator, factory: :user
    sequence(:name) { |n| "Al's Pancake World fries #{n}" }
    description "This is a test dish"
    image './fixtures/myfiles/omom.jpg'
  end
end
