class CreateBookCategory5s < ActiveRecord::Migration[6.0]
  def change
    create_table :book_category5s do |t|
      t.integer :book_id
      t.integer :category5_id

      t.timestamps
    end
  end
end
