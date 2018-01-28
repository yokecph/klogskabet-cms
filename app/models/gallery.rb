class Gallery < ApplicationRecord
  include Bilingual

  belongs_to :theme, optional: true
  has_many :images, dependent: :destroy
  has_many :devices, as: :content

  bilingual_associations :images

  validates :name, presence: true, uniqueness: true
end
