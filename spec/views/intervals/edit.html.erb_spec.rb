require 'rails_helper'

RSpec.describe "intervals/edit", type: :view do
  before(:each) do
    @interval = assign(:interval, create(:interval))
  end

  it "renders the edit interval form" do
    render

    assert_select "form[action=?][method=?]", interval_path(@interval), "post" do
      assert_select "input.form-control[name=?][required]", "interval[title_da]"
      assert_select "input.form-control[name=?]", "interval[title_en]"
      assert_select "input.form-control[name=?][required]", "interval[subtitle_da]"
      assert_select "input.form-control[name=?]", "interval[subtitle_en]"
      assert_select "textarea.form-control[name=?][required]", "interval[description_da]"
      assert_select "textarea.form-control[name=?]", "interval[description_en]"
    end
  end
end
