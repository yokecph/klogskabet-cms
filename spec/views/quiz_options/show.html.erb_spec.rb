require 'rails_helper'

RSpec.describe "quiz_options/show", type: :view do
  before(:each) do
    @quiz_option = assign(:quiz_option, create(:quiz_option))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Mulighed \d+/)
    expect(rendered).to match(/Option \d+/)
    expect(rendered).to match(/Svar \d+/)
    expect(rendered).to match(/Answer \d+/)
  end
end
