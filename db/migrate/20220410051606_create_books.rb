class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :image
      t.text :introduction
      t.integer :favorite_id
      t.integer :user_id
      t.string :star

      t.timestamps
    end
  end
end
