class Playlist < ApplicationRecord
  belongs_to :theme, optional: true
  has_many :tracks, dependent: :destroy
  has_many :devices, as: :content

  validates :name, presence: true, uniqueness: true
end
