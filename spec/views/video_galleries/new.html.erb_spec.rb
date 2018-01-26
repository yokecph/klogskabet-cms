require 'rails_helper'

RSpec.describe "video_galleries/new", type: :view do
  before(:each) do
    assign(:video_gallery, build(:video_gallery))
  end

  it "renders new video_gallery form" do
    render

    assert_select "form[action=?][method=?]", video_galleries_path, "post" do
      assert_select "input[name=?]", "video_gallery[name]"
    end
  end
end
