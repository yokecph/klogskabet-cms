require 'rails_helper'

RSpec.describe Gallery, type: :model do
  it { should belong_to(:theme) }
  it { should have_many(:devices) }
  it { should have_many(:images).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should be_a(Assignable) }
  it { should be_a(Presentable) }
  it { should be_a(Bilingual) }

  describe "assignability" do
    it "is assignable to a screen device" do
      device = build :device, kind: "screen"
      gallery = build :gallery
      expect(gallery.assignable_to?(device)).to be true
    end
  end

  describe "presentability" do
    it "is presentable when it has enough images" do
      gallery = create :gallery
      create_list(:image, Gallery::MIN_PRESENTABLE_IMAGE_COUNT, gallery: gallery)
      expect(gallery).to be_presentable
    end

    it "is not presentable when it has too few images" do
      gallery = build :gallery
      expect(gallery).to_not be_presentable
    end
  end

  describe "bilingualism" do
    it "returns true if all the gallery's images are bilingual" do
      gallery = build :gallery
      gallery.images << build(:image)
      expect(gallery).to be_bilingual
    end

    it "returns false if not all of the gallery's image are bilingual" do
      gallery = build :gallery
      gallery.images << build(:image, title_en: "")
      expect(gallery).to_not be_bilingual
    end
  end
end
