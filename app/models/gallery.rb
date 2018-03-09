class Gallery < ApplicationRecord
  MIN_PRESENTABLE_IMAGE_COUNT = 10

  include Assignable
  include Presentable
  include Bilingual

  belongs_to :theme, optional: true
  has_many :images, dependent: :destroy

  device_kind :screen
  bilingual_associations :images

  validates :name, presence: true, uniqueness: true

  # overrides Presentable method
  def presentable?
    self.images.count >= MIN_PRESENTABLE_IMAGE_COUNT
  end
end
