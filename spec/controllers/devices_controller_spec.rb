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

RSpec.describe DevicesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Device. As you add validations to Device, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    attributes_for(:device).slice(:name, :kind)
  }

  let(:invalid_attributes) {
    valid_attributes.merge({ name: "" })
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DevicesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    let(:device) { create :device }

    it "returns a success response" do
      get :show, params: {id: device.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    let(:device) { create :device }

    it "returns a success response" do
      get :edit, params: {id: device.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Device" do
        expect {
          post :create, params: {device: valid_attributes}, session: valid_session
        }.to change(Device, :count).by(1)
      end

      it "redirects to the created device" do
        post :create, params: {device: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Device.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {device: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    let(:device) { create :device }

    context "with valid params" do
      let(:new_attributes) {
        { name: "updated-device" }
      }

      it "updates the requested device" do
        put :update, params: {id: device.to_param, device: new_attributes}, session: valid_session
        device.reload
        expect(device.name).to eq "updated-device"
      end

      it "redirects to the device" do
        put :update, params: {id: device.to_param, device: valid_attributes}, session: valid_session
        expect(response).to redirect_to(device)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: {id: device.to_param, device: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:device) { create :device }

    it "destroys the requested device" do
      expect {
        delete :destroy, params: {id: device.to_param}, session: valid_session
      }.to change(Device, :count).by(-1)
    end

    it "redirects to the devices list" do
      delete :destroy, params: {id: device.to_param}, session: valid_session
      expect(response).to redirect_to(devices_url)
    end
  end

end
