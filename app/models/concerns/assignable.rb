module Assignable
  extend ActiveSupport::Concern

  included do
    has_many :devices, as: :content
  end

  module ClassMethods
    attr_reader :required_device_kind

    def device_kind(kind)
      @required_device_kind = kind.to_sym
    end
  end

  # whether the content has been assigned to a device
  def assigned?
    self.devices.any?
  end

  # whether the content is ready to be assigned
  # (override in model classes)
  def assignable?
    raise NoMethodError.new("#assignable? must be overriden in models")
  end

  # whether the given device is compatible with the receiver
  def assignable_to?(device)
    device.is_a?(Device) && device.kind.to_sym == self.class.required_device_kind
  end
end
