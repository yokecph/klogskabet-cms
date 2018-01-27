require 'rails_helper'

RSpec.describe QuizOption, type: :model do
  it { should belong_to(:quiz) }
  it { should validate_presence_of(:option_da) }
  it { should validate_presence_of(:answer_da) }
end
