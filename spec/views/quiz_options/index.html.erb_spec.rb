require 'rails_helper'

RSpec.describe "quiz_options/index", type: :view do
  before(:each) do
    @quiz = create(:quiz)
    assign(:quiz_options, create_pair(:quiz_option, quiz: @quiz))
  end

  it "renders a list of quiz_options" do
    render
    assert_select "tr>td", text: /Mulighed \d+/, count: 2
    assert_select "tr>td", text: /Option \d+/, count: 2
    assert_select "tr>td", text: /Svar \d+/, count: 2
    assert_select "tr>td", text: /Answer \d+/, count: 2
  end
end
