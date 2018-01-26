class Gallery < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :images, dependent: :destroy
end
