require "rails_helper"

RSpec.describe TimelinesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/themes/2/timelines").to route_to("timelines#index", theme_id: "2")
    end

    it "routes to #new" do
      expect(get: "/themes/2/timelines/new").to route_to("timelines#new", theme_id: "2")
    end

    it "routes to #show" do
      expect(get: "/timelines/1").to route_to("timelines#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/timelines/1/edit").to route_to("timelines#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/themes/2/timelines").to route_to("timelines#create", theme_id: "2")
    end

    it "routes to #update via PUT" do
      expect(put: "/timelines/1").to route_to("timelines#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/timelines/1").to route_to("timelines#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/timelines/1").to route_to("timelines#destroy", id: "1")
    end

  end
end
