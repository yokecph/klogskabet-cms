require 'rails_helper'

RSpec.describe TrailerGallery, type: :model do
  it { should belong_to(:theme) }
  it { should have_many(:devices) }
  it { should have_many(:trailers).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should be_a(Assignable) }
  it { should be_a(Presentable) }
  it { should be_a(Bilingual) }

  describe "assignability" do
    it "is assignable to a screen device" do
      device = build :device, kind: "screen"
      trailer_gallery = build :trailer_gallery
      expect(trailer_gallery.assignable_to?(device)).to be true
    end
  end

  describe "presentability" do
    it "is presentable when it has enough trailers" do
      trailer_gallery = create :trailer_gallery
      create_list(:trailer, TrailerGallery::MIN_PRESENTABLE_TRAILER_COUNT, trailer_gallery: trailer_gallery)
      expect(trailer_gallery).to be_presentable
    end

    it "is not presentable when it has too few trailers" do
      trailer_gallery = build :trailer_gallery
      expect(trailer_gallery).to_not be_presentable
    end
  end

  describe "bilingualism" do
    it "returns true if all the gallery's trailers are bilingual" do
      gallery = build :trailer_gallery
      gallery.trailers << build(:trailer)
      expect(gallery).to be_bilingual
    end

    it "returns false if not all of the gallery's trailers are bilingual" do
      gallery = build :trailer_gallery
      gallery.trailers << build(:trailer, title_en: "")
      expect(gallery).to_not be_bilingual
    end
  end
end
