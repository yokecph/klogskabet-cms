module Presentable
  extend ActiveSupport::Concern

  # whether the content is presentable
  def presentable?
    raise NoMethodError.new("#presentable? must be overriden in models")
  end
end
