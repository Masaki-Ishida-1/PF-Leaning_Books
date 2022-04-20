class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :book_id
      t.integer :user_id
      t.string :image

      t.timestamps
    end
  end
end
