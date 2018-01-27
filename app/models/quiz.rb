class Quiz < ApplicationRecord
  OPTION_COUNT = 5

  has_many :quiz_options, dependent: :destroy
  accepts_nested_attributes_for :quiz_options, allow_destroy: false

  validates :name, presence: true, uniqueness: true
  validates :title_da, presence: true
  validates :subtitle_da, presence: true
  validates :result_title_da, presence: true
end
