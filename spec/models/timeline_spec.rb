require 'rails_helper'

RSpec.describe Timeline, type: :model do
  it { should belong_to(:theme) }
  it { should have_many(:intervals).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:title_da) }
end
