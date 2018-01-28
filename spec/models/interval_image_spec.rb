require 'rails_helper'

RSpec.describe IntervalImage, type: :model do
  it { should belong_to(:interval) }
  it { should validate_presence_of(:description_da) }
  it { should validate_presence_of(:source_da) }
  it { should be_a(Bilingual) }
end
