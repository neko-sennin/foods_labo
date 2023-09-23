class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.string :component, null: false
      t.timestamps
    end
  end
end
