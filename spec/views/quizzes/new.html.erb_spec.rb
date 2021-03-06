require 'rails_helper'

RSpec.describe "quizzes/new", type: :view do
  before(:each) do
    @theme = assign(:theme, create(:theme))
    assign(:quiz, build(:quiz, :with_options, theme: @theme))
  end

  it "renders new quiz form" do
    render

    assert_select "form[action=?][method=?]", theme_quizzes_path(@theme), "post" do
      assert_select "input.form-control[name=?][required]", "quiz[name]"
      assert_select "input.form-control[name=?][required]", "quiz[title_da]"
      assert_select "input.form-control[name=?]", "quiz[title_en]"
      assert_select "input.form-control[name=?][required]", "quiz[subtitle_da]"
      assert_select "input.form-control[name=?]", "quiz[subtitle_en]"
      assert_select "input.form-control[name=?][required]", "quiz[result_title_da]"
      assert_select "input.form-control[name=?]", "quiz[result_title_en]"

      (0...5).each do |i|
        assert_select "input.form-control[type=text][name=?]", "quiz[quiz_options_attributes][#{i}][option_da]", count: 1
        assert_select "input.form-control[type=text][name=?]", "quiz[quiz_options_attributes][#{i}][option_en]", count: 1
        assert_select "input.form-control[type=text][name=?]", "quiz[quiz_options_attributes][#{i}][answer_da]", count: 1
        assert_select "input.form-control[type=text][name=?]", "quiz[quiz_options_attributes][#{i}][answer_en]", count: 1
      end
    end
  end
end
