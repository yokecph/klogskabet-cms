require 'rails_helper'

RSpec.describe "timelines/index", type: :view do
  before(:each) do
    assign(:timelines, create_pair(:timeline))
  end

  it "renders a list of timelines" do
    render
    assert_select "tr>td", text: /Tidslinje \d+/, count: 2
    assert_select "tr>td", text: /Timeline \d+/, count: 2
  end
end
