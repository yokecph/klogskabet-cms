require 'rails_helper'

RSpec.describe VideoGallery, type: :model do
  it { should have_many(:videos).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end
