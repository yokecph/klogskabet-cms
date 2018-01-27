require 'rails_helper'

RSpec.describe "Galleries", type: :request do
  let(:theme) { create :theme }

  describe "GET /theme/:theme_id/galleries" do
    it "works! (now write some real specs)" do
      get theme_galleries_path(theme)
      expect(response).to have_http_status(200)
    end
  end
end
