class Quiz < ApplicationRecord
  OPTION_COUNT = 5

  belongs_to :theme
  has_many :quiz_options, dependent: :destroy
  has_many :devices, as: :content

  accepts_nested_attributes_for :quiz_options, allow_destroy: false

  validates :name, presence: true, uniqueness: true
  validates :title_da, presence: true
  validates :subtitle_da, presence: true
  validates :result_title_da, presence: true
end
