require 'rails_helper'

RSpec.describe "images/index", type: :view do
  before(:each) do
    @gallery = assign(:gallery, create(:gallery))
    assign(:images, create_pair(:image, gallery: @gallery))
  end

  it "renders a list of images" do
    render
    assert_select "tr>td", text: "Dansk titel".to_s, count: 2
    assert_select "tr>td", text: "English Title".to_s, count: 2
    assert_select "tr>td", text: /lorem ipsum/i, count: 4
    assert_select "tr>td", text: "FactoryBot".to_s, count: 4
  end
end
