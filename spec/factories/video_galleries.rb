FactoryBot.define do
  factory :video_gallery do
    sequence(:name) { |n| "Video gallery #{n}" }
  end
end
