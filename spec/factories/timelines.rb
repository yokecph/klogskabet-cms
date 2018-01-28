FactoryBot.define do
  factory :timeline do
    theme
    sequence(:name) { |n| "Timeline ##{n}" }
    sequence(:title_da) { |n| "Tidslinje #{n}" }
    sequence(:title_en) { |n| "Timeline #{n}" }

    trait :with_intervals_and_images do
      after(:build) do |timeline, evaluator|
        timeline.intervals = Timeline::MIN_PRESENTABLE_INTERVAL_COUNT.times.map { build :interval, :with_interval_images }
      end
    end
  end
end
