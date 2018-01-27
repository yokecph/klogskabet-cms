require "rails_helper"

RSpec.describe GalleriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/themes/2/galleries").to route_to("galleries#index", theme_id: "2")
    end

    it "routes to #new" do
      expect(get: "/themes/2/galleries/new").to route_to("galleries#new", theme_id: "2")
    end

    it "routes to #show" do
      expect(get: "/galleries/1").to route_to("galleries#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/galleries/1/edit").to route_to("galleries#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/themes/2/galleries").to route_to("galleries#create", theme_id: "2")
    end

    it "routes to #update via PUT" do
      expect(put: "/galleries/1").to route_to("galleries#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/galleries/1").to route_to("galleries#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/galleries/1").to route_to("galleries#destroy", id: "1")
    end

  end
end
