class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.integer :category_id, null: false
      t.string :name, null: false
      t.timestamps
    end
  end
end
