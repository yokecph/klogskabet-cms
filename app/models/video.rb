class Video < ApplicationRecord
  include Bilingual

  belongs_to :video_gallery

  validates :title_da, presence: true
  validates :source_da, presence: true
  validates :youtube_id, format: { with: /\A[\w\d_-]+\z/ }
end
