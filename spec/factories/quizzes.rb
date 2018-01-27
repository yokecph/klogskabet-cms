FactoryBot.define do
  factory :quiz do
    sequence(:name) { |n| "Quiz #{n}" }
    title_da "Dansk titel"
    title_en "English Title"
    subtitle_da "Dansk undertitel"
    subtitle_en "English Subtitle"
    result_title_da "Resultater"
    result_title_en "Results"

    trait :with_options do
      after(:build) do |quiz, evaluator|
        quiz.quiz_options = Quiz::OPTION_COUNT.times.map { build(:quiz_option, quiz: quiz) }
      end
    end
  end
end
