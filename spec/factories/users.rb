FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "mail#{n}@example.com" }
    password "password"
  end
end
