require 'rails_helper'

RSpec.describe "playlists/show", type: :view do
  before(:each) do
    @playlist = assign(:playlist, create(:playlist))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(@playlist.name)
    expect(rendered).to match(@playlist.description)
  end
end
