class CreateFoodIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :food_ingredients do |t|
      t.integer :food_id, null: false
      t.integer :ingredient_id, null: false
      t.timestamps
    end
  end
end
