require 'rails_helper'

RSpec.describe Timeline, type: :model do
  it { should belong_to(:theme) }
  it { should have_many(:devices) }
  it { should have_many(:intervals).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:title_da) }
  it { should be_a(Assignable) }
  it { should be_a(Bilingual) }

  describe "assignability" do
    it "is assignable to a screen device" do
      device = build :device, kind: "screen"
      timeline = build :timeline
      expect(timeline.assignable_to?(device)).to be true
    end

    it "is assignable when it has enough intervals" do
      timeline = create :timeline
      create_list(:interval, Timeline::MIN_ASSIGNABLE_INTERVAL_COUNT, timeline: timeline)
      expect(timeline).to be_assignable
    end

    it "is not assignable when it has too few intervals" do
      timeline = create :timeline
      expect(timeline).to_not be_assignable
    end
  end

  describe "bilingualism" do
    it "returns true if all the receiver, its intervals, and their images are bilingual" do
      timeline = build :timeline
      interval = build :interval
      timeline.intervals << interval
      image = build :interval_image
      interval.interval_images << image
      expect(timeline).to be_bilingual
    end

    it "returns false if the receiver isn't bilingual" do
      timeline = build :timeline, title_en: ""
      expect(timeline).to_not be_bilingual
    end

    it "returns false if not all the receiver's intervals are bilingual" do
      timeline = build :timeline
      interval = build :interval, title_en: ""
      timeline.intervals << interval
      expect(timeline).to_not be_bilingual
    end

    it "returns false if not all 2nd order images are bilingual" do
      timeline = build :timeline
      interval = build :interval
      timeline.intervals << interval
      image = build :interval_image, description_en: ""
      interval.interval_images << image
      expect(timeline).to_not be_bilingual
    end
  end
end
