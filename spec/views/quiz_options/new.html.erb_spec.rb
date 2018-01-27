require 'rails_helper'

RSpec.describe "quiz_options/new", type: :view do
  before(:each) do
    @quiz = assign(:quiz, create(:quiz))
    assign(:quiz_option, build(:quiz_option, quiz: @quiz))
  end

  it "renders new quiz_option form" do
    render

    assert_select "form[action=?][method=?]", quiz_quiz_options_path(@quiz), "post" do
      assert_select "input[name=?]", "quiz_option[option_da]"
      assert_select "input[name=?]", "quiz_option[option_en]"
      assert_select "input[name=?]", "quiz_option[answer_da]"
      assert_select "input[name=?]", "quiz_option[answer_en]"
    end
  end
end
