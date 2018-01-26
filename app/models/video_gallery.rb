class VideoGallery < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
