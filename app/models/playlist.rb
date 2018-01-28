class Playlist < ApplicationRecord
  MIN_PRESENTABLE_TRACK_COUNT = 1

  include Assignable
  include Presentable

  belongs_to :theme, optional: true
  has_many :tracks, dependent: :destroy

  device_kind :audio

  validates :name, presence: true, uniqueness: true

  # overrides Presentable method
  def presentable?
    self.tracks.count >= MIN_PRESENTABLE_TRACK_COUNT
  end
end
