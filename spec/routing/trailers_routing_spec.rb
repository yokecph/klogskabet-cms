require "rails_helper"

RSpec.describe TrailersController, type: :routing do
  describe "routing" do

    it "routes to #new" do
      expect(get: "/trailer_galleries/2/trailers/new").to route_to("trailers#new", trailer_gallery_id: "2")
    end

    it "routes to #show" do
      expect(get: "/trailers/1").to route_to("trailers#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/trailers/1/edit").to route_to("trailers#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/trailer_galleries/2/trailers").to route_to("trailers#create", trailer_gallery_id: "2")
    end

    it "routes to #update via PUT" do
      expect(put: "/trailers/1").to route_to("trailers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/trailers/1").to route_to("trailers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/trailers/1").to route_to("trailers#destroy", id: "1")
    end

  end
end
