20.times do
  category = Category.create(name: Faker::Commerce.department)
  50.times do
    Item.create(
      category: category,
      name: Faker::Commerce.product_name,
      price: Faker::Commerce.price(0..5000.0),
      description: Faker::Lorem.paragraph
    )
  end
end
