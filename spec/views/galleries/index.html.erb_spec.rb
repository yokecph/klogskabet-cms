require 'rails_helper'

RSpec.describe "galleries/index", type: :view do
  before(:each) do
    @theme = assign(:theme, create(:theme))
    assign(:galleries, create_pair(:gallery, theme: @theme))
  end

  it "renders a list of galleries" do
    render
    assert_select "tr>td", text: /Gallery \d+/, count: 2
  end
end
