require 'rails_helper'

RSpec.describe "video_galleries/index", type: :view do
  before(:each) do
    assign(:video_galleries, create_pair(:video_gallery))
  end

  it "renders a list of video_galleries" do
    render
    assert_select "tr>td", :text => /Video gallery \d+/, :count => 2
  end
end
