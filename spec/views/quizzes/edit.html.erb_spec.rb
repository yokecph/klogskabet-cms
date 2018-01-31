require 'rails_helper'

RSpec.describe "quizzes/edit", type: :view do
  before(:each) do
    @quiz = assign(:quiz, create(:quiz, :with_options))
  end

  it "renders the edit quiz form" do
    render

    assert_select "form[action=?][method=?]", quiz_path(@quiz), "post" do
      assert_select "input.form-control[name=?][required]", "quiz[name]"
      assert_select "input.form-control[name=?][required]", "quiz[title_da]"
      assert_select "input.form-control[name=?]", "quiz[title_en]"
      assert_select "input.form-control[name=?][required]", "quiz[subtitle_da]"
      assert_select "input.form-control[name=?]", "quiz[subtitle_en]"
      assert_select "input.form-control[name=?][required]", "quiz[result_title_da]"
      assert_select "input.form-control[name=?]", "quiz[result_title_en]"

      @quiz.quiz_options.each_with_index do |option, i|
        assert_select "input[type=hidden][name=?][value=?]", "quiz[quiz_options_attributes][#{i}][id]", option.id.to_s, count: 1
        assert_select "input.form-control[type=text][name=?][value=?]", "quiz[quiz_options_attributes][#{i}][option_da]", option.option_da.to_s, count: 1
        assert_select "input.form-control[type=text][name=?][value=?]", "quiz[quiz_options_attributes][#{i}][option_en]", option.option_en.to_s, count: 1
        assert_select "input.form-control[type=text][name=?][value=?]", "quiz[quiz_options_attributes][#{i}][answer_da]", option.answer_da.to_s, count: 1
        assert_select "input.form-control[type=text][name=?][value=?]", "quiz[quiz_options_attributes][#{i}][answer_en]", option.answer_en.to_s, count: 1
      end
    end
  end
end
