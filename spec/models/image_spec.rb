require 'rails_helper'

RSpec.describe Image, type: :model do
  it { should belong_to(:gallery) }
  it { should have_many(:devices).through(:gallery) }
  it { should have_one(:theme).through(:gallery) }
  it { should validate_presence_of(:title_da) }
  it { should validate_presence_of(:source_da) }
  it { should be_a(Bilingual) }
end
