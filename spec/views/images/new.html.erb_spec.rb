require 'rails_helper'

RSpec.describe "images/new", type: :view do
  before(:each) do
    @gallery = assign(:gallery, create(:gallery))
    assign(:image, build(:image, gallery: @gallery))
  end

  it "renders new image form" do
    render

    assert_select "form[action=?][method=?]", gallery_images_path(@gallery), "post" do
      assert_select "input[name=?]", "image[title_da]"
      assert_select "input[name=?]", "image[title_en]"
      assert_select "textarea[name=?]", "image[description_da]"
      assert_select "textarea[name=?]", "image[description_en]"
      assert_select "input[name=?]", "image[source_da]"
      assert_select "input[name=?]", "image[source_en]"
    end
  end
end
