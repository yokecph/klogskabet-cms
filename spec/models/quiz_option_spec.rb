require 'rails_helper'

RSpec.describe QuizOption, type: :model do
  it { should belong_to(:quiz) }
  it { should be_a(Bilingual) }

  describe "#filled?" do
    it "returns true if the Danish strings are present" do
      option = build :quiz_option
      expect(option).to be_filled
    end

    it "returns false if either of the Danish strings are blank" do
      option = build :quiz_option, option_da: ""
      expect(option).to_not be_filled

      option = build :quiz_option, answer_da: ""
      expect(option).to_not be_filled
    end
  end
end
