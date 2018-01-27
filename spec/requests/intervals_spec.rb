require 'rails_helper'

RSpec.describe "Intervals", type: :request do
  let(:timeline) { create :timeline }

  describe "GET /timeline/:timeline_id/intervals" do
    it "works! (now write some real specs)" do
      get timeline_intervals_path(timeline)
      expect(response).to have_http_status(200)
    end
  end
end
