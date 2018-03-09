class Device < ApplicationRecord
  KINDS = %w(screen audio).freeze

  belongs_to :content, polymorphic: true, optional: true

  validates :name, presence: true, uniqueness: true, format: { with: /\A[\w\d_-]+\z/ }
  validates :kind, inclusion: { in: KINDS }, presence: true

  def screen?
    self.kind == "screen"
  end

  def audio?
    self.kind == "audio"
  end
end
