FactoryBot.define do
  factory :theme do
    sequence(:name) { |n| "Theme #{n}" }
    color Theme::COLORS.values.sample
  end
end
