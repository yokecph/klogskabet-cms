require 'rails_helper'

RSpec.describe Theme, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:color) }

  describe "#theme_name" do
    it "returns the name of the currently set color" do
      color_name = Theme::COLORS.keys.sample
      color_value = Theme::COLORS[color_name]
      theme = build :theme, color: color_value
      expect(theme.color_name).to eq color_name
    end

    it "returns nil for non-standard colors" do
      theme = build :theme, color: '#00ff00'
      expect(theme.color_name).to be_nil
    end
  end
end
