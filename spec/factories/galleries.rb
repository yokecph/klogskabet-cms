FactoryBot.define do
  factory :gallery do
    theme
    sequence(:name) { |n| "Gallery #{n}" }
  end
end
