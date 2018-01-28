class Playlist < ApplicationRecord
  MIN_ASSIGNABLE_TRACK_COUNT = 1

  include Assignable

  belongs_to :theme, optional: true
  has_many :tracks, dependent: :destroy

  device_kind :audio

  validates :name, presence: true, uniqueness: true

  # overrides Assignable method
  def assignable?
    self.tracks.count >= MIN_ASSIGNABLE_TRACK_COUNT
  end
end
