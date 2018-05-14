require 'rails_helper'

RSpec.describe "trailer_galleries/index", type: :view do
  before(:each) do
    @theme = assign(:theme, create(:theme))
    assign(:trailer_galleries, create_pair(:trailer_gallery, theme: @theme))
  end

  it "renders a list of trailer_galleries" do
    render
    assert_select "tr>td", :text => /Trailer gallery \d+/, :count => 2
  end
end
