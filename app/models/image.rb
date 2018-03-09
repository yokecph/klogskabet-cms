class Image < ApplicationRecord
  include Bilingual

  belongs_to :gallery
  has_many :devices, through: :gallery
  has_one :theme, through: :gallery, required: false

  has_attached_file :file, styles: { regular: ["1000x1000>", :jpg], thumbnail: ["64x64>", :jpg] }

  validates :title_da, presence: true
  validates :source_da, presence: true
  validates_attachment :file, presence: true, content_type: {
    content_type: /\Aimage\/(p?jpeg|png).*\z/
  }
end
