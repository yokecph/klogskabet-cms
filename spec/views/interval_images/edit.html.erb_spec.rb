require 'rails_helper'

RSpec.describe "interval_images/edit", type: :view do
  before(:each) do
    @interval_image = assign(:interval_image, create(:interval_image))
  end

  it "renders the edit interval_image form" do
    render

    assert_select "form[action=?][method=?]", interval_image_path(@interval_image), "post" do
      assert_select "textarea.form-control[name=?][required]", "interval_image[description_da]"
      assert_select "textarea.form-control[name=?]", "interval_image[description_en]"
      assert_select "input.form-control[name=?][required]", "interval_image[source_da]"
      assert_select "input.form-control[name=?]", "interval_image[source_en]"
      assert_select "input[name=?][accept=?]", "interval_image[file]", "image/jpeg,image/pjpeg,image/png"
    end
  end
end
