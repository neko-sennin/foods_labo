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

banana = Food.find_or_create_by!(name: "バナナ", category_id: 1) do |food|
  
end

Review.find_or_create_by!(title: "ダイエットに効果的！") do |review|
  review.food = banana
  review.user = taro
end


categories = [
  {id: 1, name: "果物"},
  {id: 2, name: "野菜"},
  {id: 3, name: "肉類"},
  {id: 4, name: "魚類・甲殻類"},
  {id: 5, name: "穀類(米・小麦)"}
]

categories.each do |category|
  Category.find_or_create_by(category)
end
