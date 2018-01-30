require 'rails_helper'

RSpec.describe "images/new", type: :view do
  before(:each) do
    @gallery = assign(:gallery, create(:gallery))
    assign(:image, build(:image, gallery: @gallery))
  end

  it "renders new image form" do
    render

    assert_select "form[action=?][method=?]", gallery_images_path(@gallery), "post" do
      assert_select "input.form-control[name=?][required]", "image[title_da]"
      assert_select "input.form-control[name=?]", "image[title_en]"
      assert_select "textarea.form-control[name=?][required]", "image[description_da]"
      assert_select "textarea.form-control[name=?]", "image[description_en]"
      assert_select "input.form-control[name=?][required]", "image[source_da]"
      assert_select "input.form-control[name=?]", "image[source_en]"
      assert_select "input[name=?][accept=?]", "image[file]", "image/jpeg,image/pjpeg,image/png"
    end
  end
end
