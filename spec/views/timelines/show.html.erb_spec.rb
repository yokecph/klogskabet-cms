require 'rails_helper'

RSpec.describe "timelines/show", type: :view do
  before(:each) do
    @timeline = assign(:timeline, create(:timeline))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Tidslinje \d+/)
    expect(rendered).to match(/Timeline \d+/)
  end
end
