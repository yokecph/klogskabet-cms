require 'rails_helper'

RSpec.describe "tracks/index", type: :view do
  before(:each) do
    playlist = assign(:playlist, create(:playlist))
    assign(:tracks, create_pair(:track, playlist: playlist))
  end

  it "renders a list of tracks" do
    render
    assert_select "tr>td", text: /Track \d+/, count: 2
    assert_select "tr>td", text: /lorem ipsum/i, count: 2
  end
end
