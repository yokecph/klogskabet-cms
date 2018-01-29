require 'rails_helper'

RSpec.describe IntervalImage, type: :model do
  it { should belong_to(:interval) }
  it { should have_many(:devices).through(:interval) }
  it { should have_one(:theme).through(:interval) }
  it { should validate_presence_of(:description_da) }
  it { should validate_presence_of(:source_da) }
  it { should be_a(Bilingual) }
end
