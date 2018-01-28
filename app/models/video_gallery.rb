class VideoGallery < ApplicationRecord
  MIN_ASSIGNABLE_VIDEO_COUNT = 1
  
  include Assignable
  include Bilingual

  belongs_to :theme, optional: true
  has_many :videos, dependent: :destroy

  device_kind :screen
  bilingual_associations :videos

  validates :name, presence: true, uniqueness: true

  # overrides Assignable method
  def assignable?
    self.videos.count >= MIN_ASSIGNABLE_VIDEO_COUNT
  end
end
