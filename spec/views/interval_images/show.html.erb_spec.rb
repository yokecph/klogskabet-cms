require 'rails_helper'

RSpec.describe "interval_images/show", type: :view do
  before(:each) do
    @interval_image = assign(:interval_image, create(:interval_image))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/lorem ipsum/i)
    expect(rendered).to match(/FactoryBot/)
  end
end
