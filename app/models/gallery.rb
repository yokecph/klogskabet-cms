class Gallery < ApplicationRecord
  MIN_ASSIGNABLE_IMAGE_COUNT = 10

  include Assignable
  include Bilingual

  belongs_to :theme, optional: true
  has_many :images, dependent: :destroy

  device_kind :screen
  bilingual_associations :images

  validates :name, presence: true, uniqueness: true

  # overrides Assignable method
  def assignable?
    self.images.count >= MIN_ASSIGNABLE_IMAGE_COUNT
  end
end
