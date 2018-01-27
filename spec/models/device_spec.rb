require 'rails_helper'

RSpec.describe Device, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:kind) }
end
