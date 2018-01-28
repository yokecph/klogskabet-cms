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
  it { should be_a(Assignable) }
  it { should be_a(Bilingual) }

  describe "assignability" do
    it "is assignable to a screen device" do
      device = build :device, kind: "screen"
      quiz = build :quiz
      expect(quiz.assignable_to?(device)).to be true
    end

    it "is assignable when it all its options are filled" do
      quiz = create :quiz, :with_options
      expect(quiz).to be_assignable
    end

    it "is not assignable when some of its options are unfilled" do
      quiz = create :quiz, :with_options
      quiz.quiz_options.last.update_attribute(:option_da, "")
      expect(quiz).to_not be_assignable
    end
  end

  describe "bilingualism" do
    it "returns true if all the receiver and its options are bilingual" do
      quiz = build :quiz, :with_options
      expect(quiz).to be_bilingual
    end

    it "returns false if the receiver isn't bilingual" do
      quiz = build :quiz, title_en: ""
      expect(quiz).to_not be_bilingual
    end

    it "returns false if not all of the gallery's image are bilingual" do
      quiz = build :quiz
      quiz.quiz_options << build(:quiz_option, option_en: "")
      expect(quiz).to_not be_bilingual
    end
  end
end
