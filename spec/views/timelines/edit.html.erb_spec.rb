require 'rails_helper'

RSpec.describe "timelines/edit", type: :view do
  before(:each) do
    @timeline = assign(:timeline, create(:timeline))
  end

  it "renders the edit timeline form" do
    render

    assert_select "form[action=?][method=?]", timeline_path(@timeline), "post" do
      assert_select "input.form-control[name=?][required]", "timeline[title_da]"
      assert_select "input.form-control[name=?]", "timeline[title_en]"
    end
  end
end
