require 'rails_helper'

RSpec.describe "devices/new", type: :view do
  before(:each) do
    assign(:device, build(:device))
  end

  it "renders new device form" do
    render

    assert_select "form[action=?][method=?]", devices_path, "post" do
      assert_select "input[name=?]", "device[name]"
      assert_select "select[name=?]", "device[kind]"
      Device::KINDS.each do |kind|
        assert_select "option[value=?]", kind
      end
    end
  end
end
