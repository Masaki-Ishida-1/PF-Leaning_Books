class CreateEvaluations < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluations do |t|
      t.string :user_id
      t.string :book_id
      t.integer :star

      t.timestamps
    end
  end
end
