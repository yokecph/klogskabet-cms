require 'rails_helper'

RSpec.describe "videos/index", type: :view do
  before(:each) do
    @video_gallery = create(:video_gallery)
    assign(:videos, create_pair(:video, video_gallery: @video_gallery))
  end

  it "renders a list of videos" do
    render
    assert_select "tr>td", text: "Dansk titel".to_s, count: 2
    assert_select "tr>td", text: "English Title".to_s, count: 2
    assert_select "tr>td", text: /lorem ipsum/i, count: 4
    assert_select "tr>td", text: "Foobar".to_s, count: 4
  end
end
