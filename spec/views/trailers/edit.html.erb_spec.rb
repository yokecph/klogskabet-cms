require 'rails_helper'

RSpec.describe "trailers/edit", type: :view do
  before(:each) do
    @trailer_gallery = create(:trailer_gallery)
    @trailer = assign(:trailer, create(:trailer, trailer_gallery: @trailer_gallery))
  end

  it "renders the edit trailer form" do
    render

    assert_select "form[action=?][method=?]", trailer_path(@trailer), "post" do
      assert_select "input.form-control[name=?][required]", "trailer[title_da]"
      assert_select "input.form-control[name=?]", "trailer[title_en]"
      assert_select "textarea.form-control[name=?][required]", "trailer[description_da]"
      assert_select "textarea.form-control[name=?]", "trailer[description_en]"
      assert_select "input.form-control[name=?][required]", "trailer[subtitle_da]"
      assert_select "input.form-control[name=?]", "trailer[subtitle_en]"
      assert_select "input.form-control[name=?]", "trailer[youtube_id]"
    end
  end
end
