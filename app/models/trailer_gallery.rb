class TrailerGallery < ApplicationRecord
  MIN_PRESENTABLE_TRAILER_COUNT = 1
  MAX_TRAILER_COUNT = 30

  include Presentable
  include Assignable
  include Bilingual

  belongs_to :theme, optional: true
  has_many :trailers, dependent: :destroy

  device_kind :screen
  bilingual_associations :trailers

  validates :name, presence: true, uniqueness: true

  # overrides Presentable method
  def presentable?
    self.trailers.count >= MIN_PRESENTABLE_TRAILER_COUNT
  end
end
