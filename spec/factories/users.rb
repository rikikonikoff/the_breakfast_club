FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "User #{n}" }
    sequence(:email) { |n| "email#{n}@gmail.com" }
    sequence(:encrypted_password) { |n| "password#{n}" }
  end
end
