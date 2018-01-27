require 'rails_helper'

RSpec.describe Gallery, type: :model do
  it { should belong_to(:theme) }
  it { should have_many(:images).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end
