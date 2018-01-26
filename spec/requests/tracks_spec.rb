require 'rails_helper'

RSpec.describe "Tracks", type: :request do
  let(:playlist) { create :playlist }

  describe "GET /tracks" do
    it "works! (now write some real specs)" do
      get playlist_tracks_path(playlist)
      expect(response).to have_http_status(200)
    end
  end
end
