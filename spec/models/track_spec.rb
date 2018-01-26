require 'rails_helper'

RSpec.describe Track, type: :model do
  it { should belong_to(:playlist) }
  it { should validate_presence_of(:title) }
end
