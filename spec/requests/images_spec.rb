require 'rails_helper'

RSpec.describe "Images", type: :request do
  let(:gallery) { create :gallery }

  describe "GET /galleries/:gallery_id/images" do
    it "works! (now write some real specs)" do
      get gallery_images_path(gallery)
      expect(response).to have_http_status(200)
    end
  end
end
