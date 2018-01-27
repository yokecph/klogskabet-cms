class VideoGallery < ApplicationRecord
  belongs_to :theme, optional: true
  has_many :videos, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
