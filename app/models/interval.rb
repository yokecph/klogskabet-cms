class Interval < ApplicationRecord
  MAX_INTERVAL_IMAGE_COUNT = 3

  include Bilingual

  belongs_to :timeline
  has_many :devices, through: :timeline
  has_many :interval_images, dependent: :destroy
  has_one :theme, through: :timeline, required: false

  bilingual_associations :interval_images

  validates :title_da, presence: true
  validates :subtitle_da, presence: true

  def presentable?
    self.interval_images.any?
  end
end
