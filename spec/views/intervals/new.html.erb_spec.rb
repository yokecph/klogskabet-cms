require 'rails_helper'

RSpec.describe "intervals/new", type: :view do
  before(:each) do
    @timeline = assign(:timeline, create(:timeline))
    assign(:interval, build(:interval, timeline: @timeline))
  end

  it "renders new interval form" do
    render

    assert_select "form[action=?][method=?]", timeline_intervals_path(@timeline), "post" do
      assert_select "input.form-control[name=?][required]", "interval[title_da]"
      assert_select "input.form-control[name=?]", "interval[title_en]"
      assert_select "input.form-control[name=?][required]", "interval[subtitle_da]"
      assert_select "input.form-control[name=?]", "interval[subtitle_en]"
      assert_select "textarea.form-control[name=?][required]", "interval[description_da]"
      assert_select "textarea.form-control[name=?]", "interval[description_en]"
    end
  end
end
