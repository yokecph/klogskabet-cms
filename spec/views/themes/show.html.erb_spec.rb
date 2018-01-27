require 'rails_helper'

RSpec.describe "themes/show", type: :view do
  before(:each) do
    @theme = assign(:theme, create(:theme))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(@theme.name)
    expect(rendered).to match(@theme.color_name)
  end
end
