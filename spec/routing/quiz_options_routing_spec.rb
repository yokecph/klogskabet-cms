require "rails_helper"

RSpec.describe QuizOptionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/quizzes/2/quiz_options").to route_to("quiz_options#index", quiz_id: "2")
    end

    it "routes to #new" do
      expect(get: "/quizzes/2/quiz_options/new").to route_to("quiz_options#new", quiz_id: "2")
    end

    it "routes to #show" do
      expect(get: "/quiz_options/1").to route_to("quiz_options#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/quiz_options/1/edit").to route_to("quiz_options#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/quizzes/2/quiz_options").to route_to("quiz_options#create", quiz_id: "2")
    end

    it "routes to #update via PUT" do
      expect(put: "/quiz_options/1").to route_to("quiz_options#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/quiz_options/1").to route_to("quiz_options#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/quiz_options/1").to route_to("quiz_options#destroy", id: "1")
    end

  end
end
