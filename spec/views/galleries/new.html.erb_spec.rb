require 'rails_helper'

RSpec.describe "galleries/new", type: :view do
  before(:each) do
    @theme = assign(:theme, create(:theme))
    assign(:gallery, build(:gallery, theme: @theme))
  end

  it "renders new gallery form" do
    render
    assert_select "form[action=?][method=?]", theme_galleries_path(@theme), "post" do
      assert_select "input[name=?]", "gallery[name]"
    end
  end
end
