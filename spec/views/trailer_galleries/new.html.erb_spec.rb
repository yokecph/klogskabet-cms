require 'rails_helper'

RSpec.describe "trailer_galleries/new", type: :view do
  before(:each) do
    @theme = assign(:theme, create(:theme))
    assign(:trailer_gallery, build(:trailer_gallery, theme: @theme))
  end

  it "renders new trailer_gallery form" do
    render

    assert_select "form[action=?][method=?]", theme_trailer_galleries_path(@theme), "post" do
      assert_select "input.form-control[name=?][required]", "trailer_gallery[name]"
    end
  end
end
