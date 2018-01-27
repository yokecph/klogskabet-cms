class Interval < ApplicationRecord
  belongs_to :timeline
  has_many :interval_images, dependent: :destroy

  validates :title_da, presence: true
  validates :title_en, presence: true
  validates :subtitle_da, presence: true
  validates :subtitle_en, presence: true
end
