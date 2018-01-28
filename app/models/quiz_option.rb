class QuizOption < ApplicationRecord
  include Bilingual

  belongs_to :quiz
end
