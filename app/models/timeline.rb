class Timeline < ApplicationRecord
  MIN_ASSIGNABLE_INTERVAL_COUNT = 2

  include Assignable
  include Bilingual

  belongs_to :theme, optional: true
  has_many :intervals, dependent: :destroy

  device_kind :screen
  bilingual_associations :intervals

  validates :name, presence: true, uniqueness: true
  validates :title_da, presence: true

  # overrides Assignable method
  def assignable?
    self.intervals.count >= MIN_ASSIGNABLE_INTERVAL_COUNT
  end
end
