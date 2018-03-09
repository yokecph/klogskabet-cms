require 'rails_helper'

RSpec.describe "tracks/edit", type: :view do
  before(:each) do
    @playlist = create :playlist
    @track = assign(:track, create(:track))
  end

  it "renders the edit track form" do
    render

    assert_select "form[action=?][method=?]", track_path(@track), "post" do
      assert_select "input.form-control[name=?][required]", "track[title]"
      assert_select "textarea.form-control[name=?]", "track[description]"
      assert_select "input[name=?][accept=?]", "track[mp3]", "audio/mp3,audio/mpeg"
    end
  end
end
