require 'rails_helper'

RSpec.describe VideoGallery, type: :model do
  it { should belong_to(:theme) }
  it { should have_many(:devices) }
  it { should have_many(:videos).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should be_a(Assignable) }
  it { should be_a(Bilingual) }

  describe "assignability" do
    it "is assignable to a screen device" do
      device = build :device, kind: "screen"
      video_gallery = build :video_gallery
      expect(video_gallery.assignable_to?(device)).to be true
    end

    it "is assignable when it has enough videos" do
      video_gallery = create :video_gallery
      create_list(:video, VideoGallery::MIN_ASSIGNABLE_VIDEO_COUNT, video_gallery: video_gallery)
      expect(video_gallery).to be_assignable
    end

    it "is not assignable when it has too few videos" do
      video_gallery = build :video_gallery
      expect(video_gallery).to_not be_assignable
    end
  end

  describe "bilingualism" do
    it "returns true if all the gallery's videos are bilingual" do
      gallery = build :video_gallery
      gallery.videos << build(:video)
      expect(gallery).to be_bilingual
    end

    it "returns false if not all of the gallery's videos are bilingual" do
      gallery = build :video_gallery
      gallery.videos << build(:video, title_en: "")
      expect(gallery).to_not be_bilingual
    end
  end
end
