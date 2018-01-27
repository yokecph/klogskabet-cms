FactoryBot.define do
  factory :video_gallery do
    theme
    sequence(:name) { |n| "Video gallery #{n}" }
  end
end
