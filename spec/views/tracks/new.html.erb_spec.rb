require 'rails_helper'

RSpec.describe "tracks/new", type: :view do
  before(:each) do
    @playlist = assign(:playlist, create(:playlist))
    assign(:track, build(:track, playlist: @playlist))
  end

  it "renders new track form" do
    render

    assert_select "form[action=?][method=?]", playlist_tracks_path(@playlist), "post" do
      assert_select "input.form-control[name=?][required]", "track[title]"
      assert_select "textarea.form-control[name=?]", "track[description]"
      assert_select "input[name=?][accept=?]", "track[mp3]", "audio/mp3,audio/mpeg"
    end
  end
end
