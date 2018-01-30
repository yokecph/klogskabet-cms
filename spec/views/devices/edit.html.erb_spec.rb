require 'rails_helper'

RSpec.describe "devices/edit", type: :view do
  before(:each) do
    @device = assign(:device, create(:device, kind: "audio"))
  end

  it "renders the edit device form" do
    render

    assert_select "form[action=?][method=?]", device_path(@device), "post" do
      assert_select "input.form-control[name=?][required]", "device[name]"
      assert_select "select.form-control[name=?]", "device[kind]"
      Device::KINDS.each do |kind|
        assert_select "option[value=?]", kind
      end
      assert_select "option[value=?][selected]", @device.kind
    end
  end
end
