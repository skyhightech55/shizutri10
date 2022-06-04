class CreateBookCategory7s < ActiveRecord::Migration[6.0]
  def change
    create_table :book_category7s do |t|
      t.integer :book_id
      t.integer :category7_id

      t.timestamps
    end
  end
end
