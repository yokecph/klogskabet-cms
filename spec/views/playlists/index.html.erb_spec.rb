require 'rails_helper'

RSpec.describe "playlists/index", type: :view do
  before(:each) do
    @theme = assign(:theme, create(:theme))
    assign(:playlists, create_pair(:playlist, theme: @theme))
  end

  it "renders a list of playlists" do
    render
    assert_select "tr>td", text: /Playlist \d+/, count: 2
    assert_select "tr>td", text: /^lorem ipsum/i, count: 2
  end
end
