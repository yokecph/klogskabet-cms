class IntervalImage < ApplicationRecord
  include Bilingual

  belongs_to :interval

  has_attached_file :file

  validates :description_da, presence: true
  validates :source_da, presence: true
  validates_attachment :file, presence: true, content_type: {
    content_type: /\Aimage\/(p?jpeg|png).*\z/
  }
end
