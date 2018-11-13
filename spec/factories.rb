FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "Old Books #{n}" }
  end
end
