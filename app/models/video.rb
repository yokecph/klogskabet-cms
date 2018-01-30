class Video < ApplicationRecord
  include Bilingual

  belongs_to :video_gallery
  has_many :devices, through: :video_gallery
  has_one :theme, through: :video_gallery, required: false

  validates :title_da, presence: true
  validates :source_da, presence: true
  validates :youtube_id, format: { with: /\A[\w\d_-]+\z/ }
end
