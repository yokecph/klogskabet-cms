require 'rails_helper'

RSpec.describe "QuizOptions", type: :request do
  let(:quiz) { create :quiz }
  
  describe "GET /quizzes/:quiz_id/quiz_options" do
    it "works! (now write some real specs)" do
      get quiz_quiz_options_path(quiz)
      expect(response).to have_http_status(200)
    end
  end
end
