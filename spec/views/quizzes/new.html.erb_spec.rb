require 'rails_helper'

RSpec.describe "quizzes/new", type: :view do
  before(:each) do
    assign(:quiz, build(:quiz))
  end

  it "renders new quiz form" do
    render

    assert_select "form[action=?][method=?]", quizzes_path, "post" do
      assert_select "input[name=?]", "quiz[name]"
      assert_select "input[name=?]", "quiz[title_da]"
      assert_select "input[name=?]", "quiz[title_en]"
      assert_select "input[name=?]", "quiz[subtitle_da]"
      assert_select "input[name=?]", "quiz[subtitle_en]"
      assert_select "input[name=?]", "quiz[result_title_da]"
      assert_select "input[name=?]", "quiz[result_title_en]"
    end
  end
end