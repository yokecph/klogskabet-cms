require 'rails_helper'

RSpec.describe "VideoGalleries", type: :request do
  describe "GET /video_galleries" do
    it "works! (now write some real specs)" do
      get video_galleries_path
      expect(response).to have_http_status(200)
    end
  end
end
