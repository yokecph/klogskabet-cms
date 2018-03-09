require 'rails_helper'

RSpec.describe "devices/index", type: :view do
  before(:each) do
    assign(:devices, create_pair(:device))
  end

  it "renders a list of devices" do
    render
    assert_select "tr>td", text: /test-device-\d+/, count: 2
    assert_select "tr>td", text: /(screen|audio)/i, count: 2
  end
end
