require 'rails_helper'

RSpec.describe "intervals/show", type: :view do
  before(:each) do
    @interval = assign(:interval, create(:interval))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1.-2./)
    expect(rendered).to match(/1st-2nd/)
    expect(rendered).to match(/Første til anden/)
    expect(rendered).to match(/First to second/)
    expect(rendered).to match(/lorem ipsum/i)
  end
end
