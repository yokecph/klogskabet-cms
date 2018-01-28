class Quiz < ApplicationRecord
  OPTION_COUNT = 5

  include Bilingual

  belongs_to :theme
  has_many :quiz_options, dependent: :destroy
  has_many :devices, as: :content

  accepts_nested_attributes_for :quiz_options, allow_destroy: false

  bilingual_associations :quiz_options

  validates :name, presence: true, uniqueness: true
  validates :title_da, presence: true
  validates :subtitle_da, presence: true
  validates :result_title_da, presence: true
end
