require 'rails_helper'

RSpec.describe "timelines/new", type: :view do
  before(:each) do
    @theme = assign(:theme, create(:theme))
    assign(:timeline, build(:timeline, theme: @theme))
  end

  it "renders new timeline form" do
    render

    assert_select "form[action=?][method=?]", theme_timelines_path(@theme), "post" do
      assert_select "input[name=?]", "timeline[title_da]"
      assert_select "input[name=?]", "timeline[title_en]"
    end
  end
end
