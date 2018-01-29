class Track < ApplicationRecord
  belongs_to :playlist
  has_many :devices, through: :playlist
  has_one :theme, through: :playlist, required: false

  has_attached_file :mp3

  validates :title, presence: true
  validates_attachment :mp3, presence: true, content_type: {
    content_type: /\Aaudio\/(mp3|mpeg).*\z/
  }

  def display_title
    I18n.transliterate(self.title)[0...20]
  end
end
