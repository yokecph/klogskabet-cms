require 'rails_helper'

RSpec.describe "accounts/show", type: :view do
  before do
    allow(view).to receive(:current_user).and_return(build(:user))
  end

  it "renders links for changing password and deleting the account" do
    render

    assert_select "a[href=?]", edit_account_path
    assert_select "a[href=?][data-method=?]", account_path, "delete"
  end
end
