require 'rails_helper'

RSpec.describe "intervals/index", type: :view do
  before(:each) do
    timeline = assign(:timeline, create(:timeline))
    assign(:intervals, create_pair(:interval, timeline: timeline))
  end

  it "renders a list of intervals" do
    render
    assert_select "tr>td", text: "1.-2.".to_s, count: 2
    assert_select "tr>td", text: "1st-2nd".to_s, count: 2
    assert_select "tr>td", text: "Første til anden".to_s, count: 2
    assert_select "tr>td", text: "First to second".to_s, count: 2
    assert_select "tr>td", text: /lorem ipsum/i, count: 4
  end
end
