require 'rails_helper'

RSpec.describe "playlists/new", type: :view do
  before(:each) do
    @theme = assign(:theme, create(:theme))
    assign(:playlist, build(:playlist, theme: @theme))
  end

  it "renders new playlist form" do
    render

    assert_select "form[action=?][method=?]", theme_playlists_path(@theme), "post" do
      assert_select "input[name=?]", "playlist[name]"
      assert_select "textarea[name=?]", "playlist[description]"
    end
  end
end
