require 'rails_helper'

RSpec.describe AssignmentsController, type: :controller do
  let!(:user) { sign_in_as_user }

  let(:quiz) { create :quiz, :with_options }
  let(:device) { create :device }

  describe "GET #select" do
    it "returns http success" do
      get :select, params: { content_class: 'quizzes', content_id: quiz.to_param }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #assign" do
    it "redirects back to the content" do
      post :assign, params: { content_class: 'quizzes', content_id: quiz.to_param, device_id: device.to_param }
      expect(response).to redirect_to(quiz)
    end
  end

end
