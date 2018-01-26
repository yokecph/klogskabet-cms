require "rails_helper"

RSpec.describe TracksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/playlists/2/tracks").to route_to("tracks#index", playlist_id: "2")
    end

    it "routes to #new" do
      expect(get: "playlists/2/tracks/new").to route_to("tracks#new", playlist_id: "2")
    end

    it "routes to #show" do
      expect(get: "/tracks/1").to route_to("tracks#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/tracks/1/edit").to route_to("tracks#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/playlists/2/tracks").to route_to("tracks#create", playlist_id: "2")
    end

    it "routes to #update via PUT" do
      expect(put: "/tracks/1").to route_to("tracks#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/tracks/1").to route_to("tracks#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/tracks/1").to route_to("tracks#destroy", id: "1")
    end

  end
end
