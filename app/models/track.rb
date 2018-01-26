class Track < ApplicationRecord
  belongs_to :playlist

  validates :title, presence: true
end
