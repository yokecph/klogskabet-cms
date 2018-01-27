require 'rails_helper'

RSpec.describe "Timelines", type: :request do
  let(:theme) { create :theme }

  describe "GET /themes/:theme_id/timelines" do
    it "works! (now write some real specs)" do
      get theme_timelines_path(theme)
      expect(response).to have_http_status(200)
    end
  end
end
