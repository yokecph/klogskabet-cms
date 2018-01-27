require 'rails_helper'

RSpec.describe "quiz_options/edit", type: :view do
  before(:each) do
    @quiz_option = assign(:quiz_option, create(:quiz_option))
  end

  it "renders the edit quiz_option form" do
    render

    assert_select "form[action=?][method=?]", quiz_option_path(@quiz_option), "post" do
      assert_select "input[name=?]", "quiz_option[option_da]"
      assert_select "input[name=?]", "quiz_option[option_en]"
      assert_select "input[name=?]", "quiz_option[answer_da]"
      assert_select "input[name=?]", "quiz_option[answer_en]"
    end
  end
end
