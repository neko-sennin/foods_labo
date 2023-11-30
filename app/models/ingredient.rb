class Ingredient < ApplicationRecord
  
  has_many :food_ingredients, dependent: :destroy
  has_many :foods, through: :food_ingredients
  
  validates :name, presence: true
  
end
