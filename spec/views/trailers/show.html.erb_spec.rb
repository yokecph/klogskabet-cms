require 'rails_helper'

RSpec.describe "trailers/show", type: :view do
  before(:each) do
    @trailer = assign(:trailer, create(:trailer))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Dansk titel/)
    expect(rendered).to match(/English Title/)
    expect(rendered).to match(/Lorem ipsum/i)
    expect(rendered).to match(/Foobar/)
  end
end
