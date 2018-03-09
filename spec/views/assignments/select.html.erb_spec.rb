require 'rails_helper'

RSpec.describe "assignments/select.html.erb", type: :view do
  before(:each) do
    @content = assign(:content, create(:quiz))
    @devices = assign(:devices, create_pair(:device))
  end

  it "lists devices" do
    render

    assert_select "form[action=?][method=?]", assign_device_path, "post" do
      assert_select "input[type=hidden][name=content_class][value=?]", @content.model_name.plural
      assert_select "input[type=hidden][name=content_id][value=?]", @content.to_param
      assert_select "input[type=radio][name=device_id][value=?]", @devices.first.to_param
      assert_select "input[type=radio][name=device_id][value=?]", @devices.last.to_param
    end
  end
end
