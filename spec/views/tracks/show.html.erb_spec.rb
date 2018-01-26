require 'rails_helper'

RSpec.describe "tracks/show", type: :view do
  before(:each) do
    @track = assign(:track, create(:track))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(@track.title)
    expect(rendered).to match(@track.description)
  end
end
