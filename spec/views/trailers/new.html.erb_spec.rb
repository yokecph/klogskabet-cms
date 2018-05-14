require 'rails_helper'

RSpec.describe "trailers/new", type: :view do
  before(:each) do
    @trailer_gallery = assign(:trailer_gallery, create(:trailer_gallery))
    assign(:trailer, build(:trailer, trailer_gallery: @trailer_gallery))
  end

  it "renders new video form" do
    render

    assert_select "form[action=?][method=?]", trailer_gallery_trailers_path(@trailer_gallery), "post" do
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
