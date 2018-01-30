require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ApplicationHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, type: :helper do
  let(:gallery) { create :gallery }

  describe "#preview_url_for" do
    let(:uri) {
      URI(helper.preview_url_for(gallery))
    }

    it "returns a relative URL to the preview page" do
      expect(uri.path).to eq "/preview.html"
    end

    it "adds the content type and JSON path as query params" do
      query = Rack::Utils.parse_nested_query(uri.query)
      expect(query['type']).to eq 'gallery'
      expect(query['url']).to eq url_for(gallery) + ".json"
    end
  end
end
