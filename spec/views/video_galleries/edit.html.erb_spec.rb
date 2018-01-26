require 'rails_helper'

RSpec.describe "video_galleries/edit", type: :view do
  before(:each) do
    @video_gallery = create(:video_gallery)
  end

  it "renders the edit video_gallery form" do
    render

    assert_select "form[action=?][method=?]", video_gallery_path(@video_gallery), "post" do
      assert_select "input[name=?]", "video_gallery[name]"
    end
  end
end
