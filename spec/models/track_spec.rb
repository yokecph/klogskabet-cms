require 'rails_helper'

RSpec.describe Track, type: :model do
  it { should belong_to(:playlist) }
  it { should have_many(:devices).through(:playlist) }
  it { should have_one(:theme).through(:playlist) }
  it { should validate_presence_of(:title) }

  describe "#display_title" do
    it "transliterates the title to ascii" do
      track = build :track, title: "track æøå é"
      expect(track.display_title).to eq "track aeoa e"
    end

    it "truncates the title to 20 characters" do
      track = build :track, title: "lorem ipsum dolor sit amet"
      expect(track.display_title).to eq "lorem ipsum dolor si"
    end
  end
end
