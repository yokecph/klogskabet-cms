require 'rails_helper'

RSpec.describe "video_galleries/new", type: :view do
  before(:each) do
    @theme = assign(:theme, create(:theme))
    assign(:video_gallery, build(:video_gallery, theme: @theme))
  end

  it "renders new video_gallery form" do
    render

    assert_select "form[action=?][method=?]", theme_video_galleries_path(@theme), "post" do
      assert_select "input[name=?]", "video_gallery[name]"
    end
  end
end
