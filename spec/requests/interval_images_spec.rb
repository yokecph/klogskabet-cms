require 'rails_helper'

RSpec.describe "IntervalImages", type: :request do
  let(:interval) { create :interval }

  describe "GET /interval/:interval_id/interval_images" do
    it "works! (now write some real specs)" do
      get interval_interval_images_path(interval)
      expect(response).to have_http_status(200)
    end
  end
end
