require "rails_helper"

RSpec.describe IntervalImagesController, type: :routing do
  describe "routing" do

    it "routes to #new" do
      expect(get: "/intervals/2/interval_images/new").to route_to("interval_images#new", interval_id: "2")
    end

    it "routes to #show" do
      expect(get: "/interval_images/1").to route_to("interval_images#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/interval_images/1/edit").to route_to("interval_images#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/intervals/2/interval_images").to route_to("interval_images#create", interval_id: "2")
    end

    it "routes to #update via PUT" do
      expect(put: "/interval_images/1").to route_to("interval_images#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/interval_images/1").to route_to("interval_images#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/interval_images/1").to route_to("interval_images#destroy", id: "1")
    end

  end
end
