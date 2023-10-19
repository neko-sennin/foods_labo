class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id, null: false
      t.integer :food_id, null: false
      t.string :title, null: false
      t.integer :period
      t.integer :period_method, null: false, default: 0
      t.integer :intake
      t.integer :intake_method, null: false, default: 0
      t.text :comment, null: false
      t.integer :score, null: false
      t.timestamps
    end
  end
end
