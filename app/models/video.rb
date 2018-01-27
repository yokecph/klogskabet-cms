class Video < ApplicationRecord
  belongs_to :video_gallery

  validates :title_da, presence: true
  validates :title_en, presence: true
  validates :source_da, presence: true
  validates :source_en, presence: true
end
