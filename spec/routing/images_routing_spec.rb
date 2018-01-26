require "rails_helper"

RSpec.describe ImagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/galleries/2/images").to route_to("images#index", gallery_id: "2")
    end

    it "routes to #new" do
      expect(get: "/galleries/2/images/new").to route_to("images#new", gallery_id: "2")
    end

    it "routes to #show" do
      expect(get: "/images/1").to route_to("images#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/images/1/edit").to route_to("images#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/galleries/2/images").to route_to("images#create", gallery_id: "2")
    end

    it "routes to #update via PUT" do
      expect(put: "/images/1").to route_to("images#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/images/1").to route_to("images#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/images/1").to route_to("images#destroy", id: "1")
    end

  end
end
