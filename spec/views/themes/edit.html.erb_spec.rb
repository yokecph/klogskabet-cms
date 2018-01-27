require 'rails_helper'

RSpec.describe "themes/edit", type: :view do
  before(:each) do
    @theme = assign(:theme, create(:theme))
  end

  it "renders the edit theme form" do
    render

    assert_select "form[action=?][method=?]", theme_path(@theme), "post" do
      assert_select "input[name=?]", "theme[name]"
      assert_select "select[name=?]", "theme[color]"
    end
  end
end
