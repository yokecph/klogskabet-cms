FactoryBot.define do
  factory :timeline do
    theme
    sequence(:name) { |n| "Timeline ##{n}" }
    sequence(:title_da) { |n| "Tidslinje #{n}" }
    sequence(:title_en) { |n| "Timeline #{n}" }
  end
end
