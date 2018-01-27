class QuizOption < ApplicationRecord
  belongs_to :quiz

  validates :option_da, presence: true
  validates :answer_da, presence: true
end
