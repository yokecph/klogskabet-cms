FactoryBot.define do
  factory :quiz_option do
    quiz
    sequence(:option_da) { |n| "Mulighed #{n}" }
    sequence(:option_en) { |n| "Option #{n}" }
    sequence(:answer_da) { |n| "Svar #{n}" }
    sequence(:answer_en) { |n| "Answer #{n}" }
  end
end
