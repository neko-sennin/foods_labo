class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.integer :user_id, null: false
      t.string :subject, null: false
      t.text :message, null: false
      t.text :reply
      t.timestamps
    end
  end
end
