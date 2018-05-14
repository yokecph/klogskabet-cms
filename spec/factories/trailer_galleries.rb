FactoryBot.define do
  factory :trailer_gallery do
    theme
    sequence(:name) { |n| "Trailer gallery #{n}" }

    trait :with_trailers do
      after(:build) do |trailer_gallery, evaluator|
        trailer_gallery.trailers = TrailerGallery::MIN_PRESENTABLE_VIDEO_COUNT.times.map { build :trailer }
      end
    end
  end
end
