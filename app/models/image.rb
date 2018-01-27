class Image < ApplicationRecord
  belongs_to :gallery

  has_attached_file :file

  validates :title_da, presence: true
  validates :title_en, presence: true
  validates :source_da, presence: true
  validates :source_en, presence: true
  validates_attachment :file, presence: true, content_type: {
    content_type: /\Aimage\/(p?jpeg|png).*\z/
  }
end
