require 'rails_helper'

RSpec.describe "images/show", type: :view do
  before(:each) do
    @image = assign(:image, create(:image))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Dansk titel/)
    expect(rendered).to match(/English Title/)
    expect(rendered).to match(/lorem ipsum/i)
    expect(rendered).to match(/FactoryBot/)
  end
end
