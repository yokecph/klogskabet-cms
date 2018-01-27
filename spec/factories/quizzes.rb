FactoryBot.define do
  factory :quiz do
    sequence(:name) { |n| "Quiz #{n}" }
    title_da "Dansk titel"
    title_en "English Title"
    subtitle_da "Dansk undertitel"
    subtitle_en "English Subtitle"
    result_title_da "Resultater"
    result_title_en "Results"
  end
end
