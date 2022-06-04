class CreateBookCategory3s < ActiveRecord::Migration[6.0]
  def change
    create_table :book_category3s do |t|
      t.integer :book_id
      t.integer :category3_id

      t.timestamps
    end
  end
end
