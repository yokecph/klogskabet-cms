FactoryBot.define do
  factory :gallery do
    theme
    sequence(:name) { |n| "Gallery #{n}" }

    trait :with_images do
      after(:build) do |gallery, evaluator|
        gallery.images = Gallery::MIN_PRESENTABLE_IMAGE_COUNT.times.map { build :image }
      end
    end
  end
end
