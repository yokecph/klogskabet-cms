require 'rails_helper'

RSpec.describe "video_galleries/show", type: :view do
  before(:each) do
    @video_gallery = assign(:video_gallery, create(:video_gallery))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Video gallery \d+/)
  end
end
