require 'rails_helper'

RSpec.describe "themes/index", type: :view do
  before(:each) do
    @themes = assign(:themes, create_pair(:theme))
  end

  it "renders a list of themes" do
    render
    assert_select "tr>td", text: /Theme \d+/, count: 2
    assert_select "tr>td", text: @themes.first.color_name
    assert_select "tr>td", text: @themes.last.color_name
  end
end
