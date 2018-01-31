require 'rails_helper'

RSpec.describe Interval, type: :model do
  it { should belong_to(:timeline) }
  it { should have_many(:devices).through(:timeline) }
  it { should have_many(:interval_images).dependent(:destroy) }
  it { should have_one(:theme).through(:timeline) }
  it { should validate_presence_of(:title_da) }
  it { should validate_presence_of(:subtitle_da) }
  it { should be_a(Bilingual) }

  describe "#presentable?" do
    it "returns true if there's at least one image" do
      interval = build :interval, :with_interval_images
      expect(interval.presentable?).to be true
    end

    it "returns true if there are no images" do
      interval = build :interval
      expect(interval.presentable?).to be false
    end
  end
end
