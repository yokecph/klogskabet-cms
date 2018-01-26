class Playlist < ApplicationRecord
  has_many :tracks, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
