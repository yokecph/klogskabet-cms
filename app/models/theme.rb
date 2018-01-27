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

  validates :name, presence: true, uniqueness: true
  validates :color, presence: true, format: { with: /\A#[a-f0-9]{6}\z/i }

  def color_name
    COLORS.invert[self.color]
  end
end
