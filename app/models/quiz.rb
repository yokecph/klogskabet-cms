class Quiz < ApplicationRecord
  has_many :quiz_options, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :title_da, presence: true
  validates :subtitle_da, presence: true
  validates :result_title_da, presence: true
end
