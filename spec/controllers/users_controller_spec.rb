require 'rails_helper'

RSpec.describe UsersController, type: :controller do


  context "as an admin" do |variable|
    let!(:user) { sign_in_as_user admin: true }

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    describe "POST #create" do
      context "with valid params" do
        let(:params) do
          { email: "test@example.com", admin: "1" }
        end

        it "creates a new user" do
          expect {
            post :create, params: { user: params }, format: :json
          }.to change { User.count }.by(1)
        end

        it "sends (enqueues) an invitation email" do
          expect {
            post :create, params: { user: params }
          }.to have_enqueued_job
        end
      end

      context "with invalid params" do
        let(:params) do
          { email: "not an email address...", admin: "1" }
        end

        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: { user: params }
          expect(response).to be_success
        end
      end
    end

    describe "DELETE #destroy" do
      let!(:target_user) { create :user }

      it "destroys the requested user" do
        expect {
          delete :destroy, params: { id: target_user.to_param }
        }.to change(User, :count).by(-1)
      end

      it "redirects to the tracks list" do
        delete :destroy, params: { id: target_user.to_param }
        expect(response).to redirect_to users_path
      end
    end
  end

  context "as a regular user" do
    let!(:user) { sign_in_as_user admin: false }

    describe "GET #index" do
      it "responds with forbidden" do
        get :index
        expect(response).to have_http_status(:forbidden)
      end
    end

    describe "GET #new" do
      it "responds with forbidden" do
        get :new
        expect(response).to have_http_status(:forbidden)
      end
    end

    describe "POST #create" do
      it "responds with forbidden" do
        post :create, params: { user: { email: "test@example.com" } }
        expect(response).to have_http_status(:forbidden)
      end
    end

    describe "DELETE #destroy" do
      let!(:target_user) { create :user }

      it "responds with forbidden" do
        delete :destroy, params: { id: target_user.to_param }
        expect(response).to have_http_status(:forbidden)
      end
    end

  end
end
