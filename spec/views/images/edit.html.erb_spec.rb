require 'rails_helper'

RSpec.describe "images/edit", type: :view do
  before(:each) do
    @image = assign(:image, create(:image))
  end

  it "renders the edit image form" do
    render

    assert_select "form[action=?][method=?]", image_path(@image), "post" do
      assert_select "input[name=?]", "image[title_da]"
      assert_select "input[name=?]", "image[title_en]"
      assert_select "textarea[name=?]", "image[description_da]"
      assert_select "textarea[name=?]", "image[description_en]"
      assert_select "input[name=?]", "image[source_da]"
      assert_select "input[name=?]", "image[source_en]"
    end
  end
end
