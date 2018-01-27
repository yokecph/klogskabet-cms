require 'rails_helper'

RSpec.describe QuizOption, type: :model do
  it { should belong_to(:quiz) }
end
