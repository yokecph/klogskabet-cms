require 'rails_helper'

RSpec.describe Interval, type: :model do
  it { should belong_to(:timeline) }
  it { should have_many(:interval_images).dependent(:destroy) }
  it { should validate_presence_of(:title_da) }
  it { should validate_presence_of(:title_en) }
  it { should validate_presence_of(:subtitle_da) }
  it { should validate_presence_of(:subtitle_en) }
end
