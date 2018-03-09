require "rails_helper"

RSpec.describe Api::DevicesController, type: :routing do
  describe "routing" do

    it "routes to #show" do
      expect(get: "/api/devices/test-device_1").to route_to("api/devices#show", id: "test-device_1")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/devices/test-device_1").to route_to("api/devices#update", id: "test-device_1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/devices/test-device_1").to route_to("api/devices#update", id: "test-device_1")
    end

  end
end
