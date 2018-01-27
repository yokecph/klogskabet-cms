class Timeline < ApplicationRecord
  has_many :intervals, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :title_da, presence: true
end
