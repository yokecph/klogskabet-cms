class Interval < ApplicationRecord
  include Bilingual

  belongs_to :timeline
  has_many :interval_images, dependent: :destroy

  bilingual_associations :interval_images

  validates :title_da, presence: true
  validates :title_en, presence: true
  validates :subtitle_da, presence: true
  validates :subtitle_en, presence: true
end
