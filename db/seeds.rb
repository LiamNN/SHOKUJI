require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


5.times do
  Recipe.create(
    name: Faker::Food.dish,
    meal_time: ['Breakfast', 'Lunch', 'Dinner'].sample,
    time: rand(5..45),
    user_id: 1
  )
end

5.times do
  Ingredient.create(
    name: Faker::Food.ingredient,
    # macros:,
    # photo:
  )
end

puts 'Finished!'
