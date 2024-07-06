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
hanako = User.find_or_create_by!(email: "1@gmail.com") do |user|
  user.name = "花子"
  user.password = "password"
end
zirou = User.find_or_create_by!(email: "2@gmail.com") do |user|
  user.name = "次郎"
  user.password = "password"
end


banana = Food.find_or_create_by!(name: "バナナ", category_id: 1) do |food|
  
end


Review.find_or_create_by!(title: "ダイエットに効果的！") do |review|
  review.title = "タイトル"
  review.comment = "コメント"
  review.star = 3
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

tags = [
  {id: 1, name: "ダイエット"},
  {id: 2, name: "美肌"},
  {id: 3, name: "美白"},
  {id: 4, name: "健康維持"},
  {id: 5, name: "免疫力"},
  {id: 6, name: "ストレス緩和"},
  {id: 7, name: "便秘(腸活)"},
  {id: 8, name: "体脂肪"},
  {id: 9, name: "血糖値"},
  {id: 10, name: "睡眠の質向上"}
]
tags.each do |tag|
  Tag.find_or_create_by(tag)
end
