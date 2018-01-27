class Interval < ApplicationRecord
  belongs_to :timeline

  validates :title_da, presence: true
  validates :title_en, presence: true
  validates :subtitle_da, presence: true
  validates :subtitle_en, presence: true
end
