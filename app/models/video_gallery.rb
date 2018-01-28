class VideoGallery < ApplicationRecord
  MIN_PRESENTABLE_VIDEO_COUNT = 1

  include Presentable
  include Assignable
  include Bilingual

  belongs_to :theme, optional: true
  has_many :videos, dependent: :destroy

  device_kind :screen
  bilingual_associations :videos

  validates :name, presence: true, uniqueness: true

  # overrides Presentable method
  def presentable?
    self.videos.count >= MIN_PRESENTABLE_VIDEO_COUNT
  end
end
