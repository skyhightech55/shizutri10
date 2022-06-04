class CreateBookCategory4s < ActiveRecord::Migration[6.0]
  def change
    create_table :book_category4s do |t|
      t.integer :book_id
      t.integer :category4_id

      t.timestamps
    end
  end
end
