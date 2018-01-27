require 'rails_helper'

RSpec.describe "themes/new", type: :view do
  before(:each) do
    assign(:theme, build(:theme))
  end

  it "renders new theme form" do
    render

    assert_select "form[action=?][method=?]", themes_path, "post" do
      assert_select "input[name=?]", "theme[name]"
      assert_select "select[name=?]", "theme[color]"
    end
  end
end
