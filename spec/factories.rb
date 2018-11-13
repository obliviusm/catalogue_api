FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "Old Books #{n}" }
  end

  factory :item do
    category
    sequence(:name) { |n| "Harry Potter #{n}" }
    price { 12.50 }
    description { "Great book by J.K. Rowling" }
  end
end
