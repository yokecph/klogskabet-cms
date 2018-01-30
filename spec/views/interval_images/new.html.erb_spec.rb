require 'rails_helper'

RSpec.describe "interval_images/new", type: :view do
  before(:each) do
    @interval = assign(:interval, create(:interval))
    assign(:interval_image, build(:interval_image, interval: @interval))
  end

  it "renders new interval_image form" do
    render

    assert_select "form[action=?][method=?]", interval_interval_images_path(@interval), "post" do
      assert_select "input.form-control[name=?][required]", "interval_image[description_da]"
      assert_select "input.form-control[name=?]", "interval_image[description_en]"
      assert_select "input.form-control[name=?][required]", "interval_image[source_da]"
      assert_select "input.form-control[name=?]", "interval_image[source_en]"
      assert_select "input[name=?][accept=?]", "interval_image[file]", "image/jpeg,image/pjpeg,image/png"
    end
  end
end
