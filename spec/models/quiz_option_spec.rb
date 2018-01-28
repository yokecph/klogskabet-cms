require 'rails_helper'

RSpec.describe QuizOption, type: :model do
  it { should belong_to(:quiz) }
  it { should be_a(Bilingual) }
end
