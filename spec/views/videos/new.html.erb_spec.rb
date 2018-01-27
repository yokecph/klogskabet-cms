require 'rails_helper'

RSpec.describe "videos/new", type: :view do
  before(:each) do
    @video_gallery = assign(:video_gallery, create(:video_gallery))
    assign(:video, build(:video, video_gallery: @video_gallery))
  end

  it "renders new video form" do
    render

    assert_select "form[action=?][method=?]", video_gallery_videos_path(@video_gallery), "post" do
      assert_select "input[name=?]", "video[title_da]"
      assert_select "input[name=?]", "video[title_en]"
      assert_select "textarea[name=?]", "video[description_da]"
      assert_select "textarea[name=?]", "video[description_en]"
      assert_select "input[name=?]", "video[source_da]"
      assert_select "input[name=?]", "video[source_en]"
      assert_select "input[name=?]", "video[youtube_id]"
    end
  end
end