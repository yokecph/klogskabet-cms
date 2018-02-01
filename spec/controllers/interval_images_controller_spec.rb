require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe IntervalImagesController, type: :controller do
  let!(:user) { sign_in_as_user }

  # This should return the minimal set of attributes required to create a valid
  # IntervalImage. As you add validations to IntervalImage, be sure to
  # adjust the attributes here as well.
  let(:interval) { create :interval }

  let(:valid_attributes) {
    attributes_for(:interval_image_upload).merge({
      file: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', "test.jpg"), "image/jpeg")
    })
  }

  let(:invalid_attributes) {
    attributes_for(:interval_image_upload, description_da: "")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # IntervalImagesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: { interval_id: interval.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    let(:interval_image) { create :interval_image }

    it "returns a success response" do
      get :show, params: {id: interval_image.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: { interval_id: interval.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    let(:interval_image) { create :interval_image }

    it "returns a success response" do
      get :edit, params: {id: interval_image.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new IntervalImage" do
        expect {
          post :create, params: {interval_id: interval.to_param, interval_image: valid_attributes}, session: valid_session
        }.to change(IntervalImage, :count).by(1)
      end

      it "redirects to the created interval_image" do
        post :create, params: {interval_id: interval.to_param, interval_image: valid_attributes}, session: valid_session
        expect(response).to redirect_to(IntervalImage.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {interval_id: interval.to_param, interval_image: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    let(:interval_image) { create :interval_image }

    context "with valid params" do
      let(:new_attributes) {
        { description_da: "New description" }
      }

      it "updates the requested interval_image" do
        put :update, params: {id: interval_image.to_param, interval_image: new_attributes}, session: valid_session
        interval_image.reload
        expect(interval_image.description_da).to eq "New description"
      end

      it "redirects to the interval_image" do
        put :update, params: {id: interval_image.to_param, interval_image: valid_attributes}, session: valid_session
        expect(response).to redirect_to(interval_image)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: {id: interval_image.to_param, interval_image: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:interval_image) { create :interval_image, interval: interval }

    it "destroys the requested interval_image" do
      expect {
        delete :destroy, params: {id: interval_image.to_param}, session: valid_session
      }.to change(IntervalImage, :count).by(-1)
    end

    it "redirects to the interval_images list" do
      delete :destroy, params: {id: interval_image.to_param}, session: valid_session
      expect(response).to redirect_to(interval)
    end
  end

end
