class Video < ApplicationRecord
  include Bilingual

  belongs_to :video_gallery
  has_many :devices, through: :video_gallery
  has_one :theme, through: :video_gallery, required: false

  validates :title_da, presence: true
  validates :subtitle_da, presence: true
  validates :youtube_id, format: { with: /\A[\w\d_-]+\z/ }, unless: -> { youtube_id.blank? }

  has_attached_file :mp4
  validates_attachment :mp4, content_type: {
    content_type: /\Avideo\/mp4\z/
  }

  validates_with VideoValidator
end
