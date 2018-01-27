class Gallery < ApplicationRecord
  belongs_to :theme, optional: true
  has_many :images, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
