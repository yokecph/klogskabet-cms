require 'rails_helper'

RSpec.describe "accounts/edit", type: :view do
  before do
    allow(view).to receive(:current_user).and_return(build(:user))
  end

  it "renders the edit device form" do
    render

    assert_select "form[action=?][method=?]", account_path, "post" do
      assert_select "input.form-control[type=password][name=?]", "account[current_password]"
      assert_select "input.form-control[type=password][name=?]", "account[password]"
      assert_select "input.form-control[type=password][name=?]", "account[password_confirmation]"
    end
  end
end
