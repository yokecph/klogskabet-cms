require 'rails_helper'

RSpec.describe "devices/index", type: :view do
  before(:each) do
    assign(:devices, create_pair(:device))
  end

  it "renders a list of devices" do
    render
    assert_select "tr>td", text: /test-device-\d+/, count: 2
    assert_select "tr>td", text: /(screen|audio)/, count: 2
    assert_select "tr>td", text: "0000".to_s, count: 2
    assert_select "tr>td", text: "192.168.0.10".to_s, count: 2
    assert_select "tr>td", text: "10.0.0.10".to_s, count: 2
  end
end
