require 'rails_helper'

RSpec.describe "VideoGalleries", type: :request do
  let(:theme) { create :theme }

  describe "GET /themes/:theme_id/video_galleries" do
    it "works! (now write some real specs)" do
      get theme_video_galleries_path(theme)
      expect(response).to have_http_status(200)
    end
  end
end
