require 'rails_helper'

RSpec.describe "Videos", type: :request do
  let(:video_gallery) { create :video_gallery }

  describe "GET /video_galleries/:video_gallery_id/videos" do
    it "works! (now write some real specs)" do
      get video_gallery_videos_path(video_gallery)
      expect(response).to have_http_status(200)
    end
  end
end
