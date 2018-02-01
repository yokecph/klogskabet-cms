require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  let!(:user) { sign_in_as_user password: "password1", password_confirmation: "password1" }

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        {
          current_password: "password1",
          password: "password2",
          password_confirmation: "password2"
        }
      end

      it "updates the user's password" do
        put :update, params: { account: new_attributes }
        user.reload
        expect(user.valid_password?("password2")).to be true
      end

      it "redirects to the account page" do
        put :update, params: { account: new_attributes }
        expect(response).to redirect_to(account_path)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: { account: { password: "notright"} }
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the current user" do
      expect {
        delete :destroy
      }.to change(User, :count).by(-1)

      expect { user.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it "redirects to the root path" do
      delete :destroy
      expect(response).to redirect_to(root_path)
    end
  end
end
