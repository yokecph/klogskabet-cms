FactoryBot.define do
  factory :video_gallery do
    theme
    sequence(:name) { |n| "Video gallery #{n}" }

    trait :with_videos do
      after(:build) do |video_gallery, evaluator|
        video_gallery.videos = VideoGallery::MIN_PRESENTABLE_VIDEO_COUNT.times.map { build :video }
      end
    end
  end
end
