class Theme < ApplicationRecord
  COLORS = {
    "Yellow" => '#fffbbd',
    "Pink" => '#ffddff',
    "Green" => '#bce6bc',
    "Orange" => '#ffd7b3',
    "Blue" => '#b7d7ed',
    "Warm grey" => '#cfd0d0',
    "Purple" => '#dac2ff'
  }.freeze

  has_many :galleries, -> { order(:name) }, dependent: :destroy
  has_many :playlists, -> { order(:name) }, dependent: :destroy
  has_many :quizzes, -> { order(:name) }, dependent: :destroy
  has_many :timelines, -> { order(:name) }, dependent: :destroy
  has_many :video_galleries, -> { order(:name) }, dependent: :destroy
  has_many :trailer_galleries, -> { order(:name) }, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :color, presence: true, format: { with: /\A#[a-f0-9]{6}\z/i }

  def color_name
    COLORS.invert[self.color]
  end
end
