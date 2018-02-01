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

RSpec.describe PlaylistsController, type: :controller do
  let!(:user) { sign_in_as_user }

  # This should return the minimal set of attributes required to create a valid
  # Playlist. As you add validations to Playlist, be sure to
  # adjust the attributes here as well.
  let(:theme) { create :theme }

  let(:valid_attributes) {
    attributes_for(:playlist)
  }

  let(:invalid_attributes) {
    attributes_for(:playlist, name: "")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PlaylistsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: { theme_id: theme.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    let!(:playlist) { create :playlist, theme: theme }

    it "returns a success response" do
      get :show, params: {id: playlist.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: { theme_id: theme.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    let!(:playlist) { create :playlist, theme: theme }

    it "returns a success response" do
      get :edit, params: {id: playlist.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Playlist" do
        expect {
          post :create, params: { theme_id: theme.to_param, playlist: valid_attributes}, session: valid_session
        }.to change(Playlist, :count).by(1)
      end

      it "redirects to the created playlist" do
        post :create, params: { theme_id: theme.to_param, playlist: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Playlist.last)
      end
    end

    context "with invalid params" do
      let(:attributes) { attributes_for(:playlist, name: "") }

      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { theme_id: theme.to_param, playlist: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    let(:playlist) { create :playlist, theme: theme }

    context "with valid params" do
      let(:new_attributes) {
        attributes_for(:playlist, name: "New name")
      }

      it "updates the requested playlist" do
        put :update, params: {id: playlist.to_param, playlist: new_attributes}, session: valid_session
        playlist.reload
        expect(playlist.name).to eq "New name"
      end

      it "redirects to the playlist" do
        put :update, params: {id: playlist.to_param, playlist: valid_attributes}, session: valid_session
        expect(response).to redirect_to(playlist)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: {id: playlist.to_param, playlist: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:playlist) { create :playlist, theme: theme }

    it "destroys the requested playlist" do
      expect {
        delete :destroy, params: {id: playlist.to_param}, session: valid_session
      }.to change(Playlist, :count).by(-1)
    end

    it "redirects to the playlists list" do
      delete :destroy, params: {id: playlist.to_param}, session: valid_session
      expect(response).to redirect_to(theme)
    end
  end

end
