class Timeline < ApplicationRecord
  belongs_to :theme, optional: true
  has_many :intervals, dependent: :destroy
  has_many :devices, as: :content

  validates :name, presence: true, uniqueness: true
  validates :title_da, presence: true
end
