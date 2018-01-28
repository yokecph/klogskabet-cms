class QuizOption < ApplicationRecord
  include Bilingual

  belongs_to :quiz

  # does this quiz option have the minimum of information to be
  # shown on a device? Used by Quiz to determine if the quiz itself
  # is assignable to a device
  def filled?
    self.option_da.present? && self.answer_da.present?
  end
end
