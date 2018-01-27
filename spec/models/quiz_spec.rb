require 'rails_helper'

RSpec.describe Quiz, type: :model do
  it { should belong_to(:theme) }
  it { should have_many(:devices) }
  it { should have_many(:quiz_options).dependent(:destroy) }
  it { should accept_nested_attributes_for(:quiz_options).allow_destroy(false) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:title_da) }
  it { should validate_presence_of(:subtitle_da) }
  it { should validate_presence_of(:result_title_da) }
end
