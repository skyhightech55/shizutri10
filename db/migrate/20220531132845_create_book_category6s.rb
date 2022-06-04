class CreateBookCategory6s < ActiveRecord::Migration[6.0]
  def change
    create_table :book_category6s do |t|
      t.integer :book_id
      t.integer :category6_id

      t.timestamps
    end
  end
end
