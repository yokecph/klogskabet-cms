require 'rails_helper'

RSpec.describe Playlist, type: :model do
  it { should belong_to(:theme) }
  it { should have_many(:devices) }
  it { should have_many(:tracks).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should be_a(Assignable) }
  it { should be_a(Presentable) }

  describe "assignability" do
    it "is assignable to an audio device" do
      device = build :device, kind: "audio"
      playlist = build :playlist
      expect(playlist.assignable_to?(device)).to be true
    end
  end

  describe "presentability" do
    it "is presentable when it has enough tracks" do
      playlist = create :playlist
      create_list(:track, Gallery::MIN_PRESENTABLE_IMAGE_COUNT, playlist: playlist)
      expect(playlist).to be_presentable
    end

    it "is not presentable when it has too few tracks" do
      playlist = build :playlist
      expect(playlist).to_not be_presentable
    end
  end
end
