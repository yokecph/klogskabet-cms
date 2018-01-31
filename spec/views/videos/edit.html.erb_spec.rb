require 'rails_helper'

RSpec.describe "videos/edit", type: :view do
  before(:each) do
    @video_gallery = create(:video_gallery)
    @video = assign(:video, create(:video, video_gallery: @video_gallery))
  end

  it "renders the edit video form" do
    render

    assert_select "form[action=?][method=?]", video_path(@video), "post" do
      assert_select "input.form-control[name=?][required]", "video[title_da]"
      assert_select "input.form-control[name=?]", "video[title_en]"
      assert_select "textarea.form-control[name=?][required]", "video[description_da]"
      assert_select "textarea.form-control[name=?]", "video[description_en]"
      assert_select "input.form-control[name=?][required]", "video[subtitle_da]"
      assert_select "input.form-control[name=?]", "video[subtitle_en]"
      assert_select "input.form-control[name=?]", "video[youtube_id]"
    end
  end
end
