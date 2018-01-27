require 'rails_helper'

RSpec.describe "timelines/new", type: :view do
  before(:each) do
    assign(:timeline, build(:timeline))
  end

  it "renders new timeline form" do
    render

    assert_select "form[action=?][method=?]", timelines_path, "post" do
      assert_select "input[name=?]", "timeline[title_da]"
      assert_select "input[name=?]", "timeline[title_en]"
    end
  end
end
