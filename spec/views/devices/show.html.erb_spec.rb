require 'rails_helper'

RSpec.describe "devices/show", type: :view do
  before(:each) do
    @device = assign(:device, create(:device))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(@device.name)
    expect(rendered).to match(@device.kind.capitalize)
    if @device.audio?
      expect(rendered).to match(@device.eth_ip)
      expect(rendered).to match(@device.wlan_ip)
    end
  end
end
