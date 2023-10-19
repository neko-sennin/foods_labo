class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.integer :food_id, null: false
      t.string :name, null: false
      t.timestamps
    end
  end
end
