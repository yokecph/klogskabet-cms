require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before do
    assign(:user, build(:user))
  end

  it "renders new track form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input.form-control[type=email][name=?][required]", "user[email]"
      assert_select "input[type=checkbox][name=?]", "user[admin]"
    end
  end
end
