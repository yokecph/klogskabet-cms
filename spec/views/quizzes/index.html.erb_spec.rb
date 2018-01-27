require 'rails_helper'

RSpec.describe "quizzes/index", type: :view do
  before(:each) do
    @theme = assign(:theme, create(:theme))
    assign(:quizzes, create_pair(:quiz, theme: @theme))
  end

  it "renders a list of quizzes" do
    render
    assert_select "tr>td", text: /Quiz \d+/, count: 2
    assert_select "tr>td", text: "Dansk titel".to_s, count: 2
    assert_select "tr>td", text: "English Title".to_s, count: 2
    assert_select "tr>td", text: "Dansk undertitel".to_s, count: 2
    assert_select "tr>td", text: "English Subtitle".to_s, count: 2
    assert_select "tr>td", text: "Resultater".to_s, count: 2
    assert_select "tr>td", text: "Results".to_s, count: 2
  end
end
