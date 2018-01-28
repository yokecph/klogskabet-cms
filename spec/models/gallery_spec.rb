require 'rails_helper'

RSpec.describe Gallery, type: :model do
  it { should belong_to(:theme) }
  it { should have_many(:devices) }
  it { should have_many(:images).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should be_a(Bilingual) }

  describe "bilingual" do
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
