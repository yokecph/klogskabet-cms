require "rails_helper"

RSpec.describe VideoGalleriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/themes/2/video_galleries").to route_to("video_galleries#index", theme_id: "2")
    end

    it "routes to #new" do
      expect(get: "/themes/2/video_galleries/new").to route_to("video_galleries#new", theme_id: "2")
    end

    it "routes to #show" do
      expect(get: "/video_galleries/1").to route_to("video_galleries#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/video_galleries/1/edit").to route_to("video_galleries#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/themes/2/video_galleries").to route_to("video_galleries#create", theme_id: "2")
    end

    it "routes to #update via PUT" do
      expect(put: "/video_galleries/1").to route_to("video_galleries#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/video_galleries/1").to route_to("video_galleries#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/video_galleries/1").to route_to("video_galleries#destroy", id: "1")
    end

  end
end
