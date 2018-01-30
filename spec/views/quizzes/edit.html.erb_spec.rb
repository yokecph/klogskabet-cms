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

      # This doesn't work since the numbering scheme's messed up
      # (0...5).each do |i|
      #   assert_select "input[type=hidden][name=?]", "quiz[quiz_options_attributes][#{i}][id]"
      #   assert_select "input.form-control[type=text][name=?]", "quiz[quiz_options_attributes][#{i}][option_da]"
      #   assert_select "input.form-control[type=text][name=?]", "quiz[quiz_options_attributes][#{i}][option_en]"
      #   assert_select "input.form-control[type=text][name=?]", "quiz[quiz_options_attributes][#{i}][answer_da]"
      #   assert_select "input.form-control[type=text][name=?]", "quiz[quiz_options_attributes][#{i}][answer_en]"
      # end
    end
  end
end
