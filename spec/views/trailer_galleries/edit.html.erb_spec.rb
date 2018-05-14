require 'rails_helper'

RSpec.describe "trailer_galleries/edit", type: :view do
  before(:each) do
    @trailer_gallery = create(:trailer_gallery)
  end

  it "renders the edit trailer_gallery form" do
    render

    assert_select "form[action=?][method=?]", trailer_gallery_path(@trailer_gallery), "post" do
      assert_select "input.form-control[name=?][required]", "trailer_gallery[name]"
    end
  end
end
