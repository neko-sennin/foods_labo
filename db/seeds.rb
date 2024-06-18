# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'admin@admin',
  password: 'testtest'
)

taro = User.find_or_create_by!(email: "user@user") do |user|
  user.name = "太郎"
  user.password = "password"
end

banana = Food.find_or_create_by!(name: "バナナ") do |food|
  food.category_id = fruit
end

fruit = Category.find_or_create_by!(name: "果物") do |category|
  
end

Review.find_or_create_by!(title: "ダイエットに効果的！") do |review|
  review.food = banana
  review.user = taro
end
