require 'rails_helper'

RSpec.describe Trailer, type: :model do
  it { should belong_to(:trailer_gallery) }
  it { should have_many(:devices).through(:trailer_gallery) }
  it { should have_one(:theme).through(:trailer_gallery) }
  it { should validate_presence_of(:title_da) }
  it { should validate_presence_of(:subtitle_da) }
  it { should be_a(Bilingual) }
end
