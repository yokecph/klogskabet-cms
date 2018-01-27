require 'rails_helper'

RSpec.describe "videos/show", type: :view do
  before(:each) do
    @video = assign(:video, create(:video))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Dansk titel/)
    expect(rendered).to match(/English Title/)
    expect(rendered).to match(/Lorem ipsum/i)
    expect(rendered).to match(/FactoryBot/)
  end
end
