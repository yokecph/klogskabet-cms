require 'rails_helper'

RSpec.describe Quiz, type: :model do
  it { should have_many(:quiz_options).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:title_da) }
  it { should validate_presence_of(:subtitle_da) }
  it { should validate_presence_of(:result_title_da) }
end
