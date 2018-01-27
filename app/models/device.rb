class Device < ApplicationRecord
  KINDS = %w(screen audio).freeze
  validates :name, presence: true, uniqueness: true, format: { with: /\A[\w\d_-]+\z/ }
  validates :kind, inclusion: { in: KINDS }, presence: true
end
