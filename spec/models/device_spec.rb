require 'rails_helper'

RSpec.describe Device, type: :model do
  it { should belong_to(:content) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:kind) }

  describe "#screen?" do
    it "returns true if the device is a screen module" do
      device = build :device, kind: :screen
      expect(device).to be_screen
    end

    it "returns false otherwise" do
      device = build :device, kind: :audio
      expect(device).to_not be_screen
    end
  end

  describe "#audio?" do
    it "returns true if the device is an audio module" do
      device = build :device, kind: :audio
      expect(device).to be_audio
    end

    it "returns false otherwise" do
      device = build :device, kind: :screen
      expect(device).to_not be_audio
    end
  end
end
