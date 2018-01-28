class Timeline < ApplicationRecord
  include Bilingual

  belongs_to :theme, optional: true
  has_many :intervals, dependent: :destroy
  has_many :devices, as: :content

  bilingual_associations :intervals

  validates :name, presence: true, uniqueness: true
  validates :title_da, presence: true
end
