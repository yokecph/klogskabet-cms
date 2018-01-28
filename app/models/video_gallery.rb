class VideoGallery < ApplicationRecord
  include Bilingual

  belongs_to :theme, optional: true
  has_many :videos, dependent: :destroy
  has_many :devices, as: :content

  bilingual_associations :videos

  validates :name, presence: true, uniqueness: true
end
