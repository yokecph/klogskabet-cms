require 'rails_helper'

RSpec.describe Playlist, type: :model do
  it { should have_many(:tracks).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end
