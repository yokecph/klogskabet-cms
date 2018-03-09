require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    @users = create_pair(:user)
    @users.last.update_attribute(:admin, true)
    assign(:users, @users)
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", text: /mail\d+@example\.com/, count: 2
    assert_select "a[href=?][data-method=?]", user_path(@users.first), "delete", count: 1
    assert_select "a[href=?][data-method=?]", user_path(@users.last), "delete", count: 1
    assert_select "span.label", text: /admin/i, count: 1
  end
end
