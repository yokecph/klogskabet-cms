class Playlist < ApplicationRecord
  belongs_to :theme, optional: true
  has_many :tracks, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
