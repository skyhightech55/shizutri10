class CreateBookCategory2s < ActiveRecord::Migration[6.0]
  def change
    create_table :book_category2s do |t|
      t.integer :book_id
      t.integer :category2_id

      t.timestamps
    end
  end
end
