require 'rails_helper'

RSpec.describe "trailer_galleries/show", type: :view do
  before(:each) do
    @trailer_gallery = assign(:trailer_gallery, create(:trailer_gallery))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Trailer gallery \d+/)
  end
end
