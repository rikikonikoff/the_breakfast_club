FactoryGirl.define do
  factory :vote do
    association :creator
    association :reviewer
    value 1
  end
end
