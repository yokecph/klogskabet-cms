require "rails_helper"

RSpec.describe VideosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/video_galleries/2/videos").to route_to("videos#index", video_gallery_id: "2")
    end

    it "routes to #new" do
      expect(get: "/video_galleries/2/videos/new").to route_to("videos#new", video_gallery_id: "2")
    end

    it "routes to #show" do
      expect(get: "/videos/1").to route_to("videos#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/videos/1/edit").to route_to("videos#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/video_galleries/2/videos").to route_to("videos#create", video_gallery_id: "2")
    end

    it "routes to #update via PUT" do
      expect(put: "/videos/1").to route_to("videos#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/videos/1").to route_to("videos#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/videos/1").to route_to("videos#destroy", id: "1")
    end

  end
end