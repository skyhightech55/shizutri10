class CreateCategory7s < ActiveRecord::Migration[6.0]
  def change
    create_table :category7s do |t|
      t.string :name

      t.timestamps
    end
  end
end
