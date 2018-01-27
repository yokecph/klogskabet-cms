require 'rails_helper'

RSpec.describe "quizzes/edit", type: :view do
  before(:each) do
    @quiz = assign(:quiz, create(:quiz))
  end

  it "renders the edit quiz form" do
    render

    assert_select "form[action=?][method=?]", quiz_path(@quiz), "post" do
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
