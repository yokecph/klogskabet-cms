require 'rails_helper'

RSpec.describe "images/edit", type: :view do
  before(:each) do
    @image = assign(:image, create(:image))
  end

  it "renders the edit image form" do
    render

    assert_select "form[action=?][method=?]", image_path(@image), "post" do
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
