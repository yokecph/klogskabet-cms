require 'rails_helper'

RSpec.describe "quizzes/show", type: :view do
  before(:each) do
    @quiz = assign(:quiz, create(:quiz))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Quiz \d+/)
    expect(rendered).to match(/Dansk titel/)
    expect(rendered).to match(/English Title/)
    expect(rendered).to match(/Dansk undertitel/)
    expect(rendered).to match(/English Subtitle/)
    expect(rendered).to match(/Resultater/)
    expect(rendered).to match(/Results/)
  end
end
