require 'rails_helper'

RSpec.describe "playlists/edit", type: :view do
  before(:each) do
    @playlist = assign(:playlist, create(:playlist,
      name: "MyString",
      description: "MyText"
    ))
  end

  it "renders the edit playlist form" do
    render

    assert_select "form[action=?][method=?]", playlist_path(@playlist), "post" do
      assert_select "input[name=?]", "playlist[name]"
      assert_select "textarea[name=?]", "playlist[description]"
    end
  end
end
