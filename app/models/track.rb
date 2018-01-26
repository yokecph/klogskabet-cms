class Track < ApplicationRecord
  belongs_to :playlist

  has_attached_file :mp3

  validates :title, presence: true
  validates_attachment :mp3, presence: true, content_type: {
    content_type: /\Aaudio\/(mp3|mpeg).*\z/
  }
end
