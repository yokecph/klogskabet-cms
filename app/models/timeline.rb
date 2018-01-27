class Timeline < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :title_da, presence: true
end
