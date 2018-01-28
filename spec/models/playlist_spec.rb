require 'rails_helper'

RSpec.describe Playlist, type: :model do
  it { should belong_to(:theme) }
  it { should have_many(:devices) }
  it { should have_many(:tracks).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should be_a(Assignable) }

  describe "assignability" do
    it "is assignable to an audio device" do
      device = build :device, kind: "audio"
      playlist = build :playlist
      expect(playlist.assignable_to?(device)).to be true
    end

    it "is assignable when it has enough tracks" do
      playlist = create :playlist
      create_list(:track, Gallery::MIN_ASSIGNABLE_IMAGE_COUNT, playlist: playlist)
      expect(playlist).to be_assignable
    end

    it "is not assignable when it has too few tracks" do
      playlist = build :playlist
      expect(playlist).to_not be_assignable
    end
  end
end
