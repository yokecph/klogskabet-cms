require 'rails_helper'

RSpec.describe "playlists/new", type: :view do
  before(:each) do
    assign(:playlist, build(:playlist))
  end

  it "renders new playlist form" do
    render

    assert_select "form[action=?][method=?]", playlists_path, "post" do
      assert_select "input[name=?]", "playlist[name]"
      assert_select "textarea[name=?]", "playlist[description]"
    end
  end
end
