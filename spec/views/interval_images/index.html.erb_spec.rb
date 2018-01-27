require 'rails_helper'

RSpec.describe "interval_images/index", type: :view do
  before(:each) do
    @interval = assign(:interval, create(:interval))
    assign(:interval_images, create_pair(:interval_image, interval: @interval))
  end

  it "renders a list of interval_images" do
    render
    assert_select "tr>td", text: /lorem ipsum/i, count: 4
    assert_select "tr>td", text: "FactoryBot".to_s, count: 4
  end
end
