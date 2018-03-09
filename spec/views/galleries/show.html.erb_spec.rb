require 'rails_helper'

RSpec.describe "galleries/show", type: :view do
  before(:each) do
    @gallery = assign(:gallery, create(:gallery))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Gallery \d+/)
  end
end
