class Timeline < ApplicationRecord
  MIN_PRESENTABLE_INTERVAL_COUNT = 2

  include Presentable
  include Assignable
  include Bilingual

  belongs_to :theme, optional: true
  has_many :intervals, dependent: :destroy

  device_kind :screen
  bilingual_associations :intervals

  validates :name, presence: true, uniqueness: true
  validates :title_da, presence: true

  # overrides Presentable method
  def presentable?
    return false if self.intervals.count < MIN_PRESENTABLE_INTERVAL_COUNT
    self.intervals.all?(&:presentable?)
  end
end
