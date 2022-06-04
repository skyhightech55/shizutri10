class CreateCategory4s < ActiveRecord::Migration[6.0]
  def change
    create_table :category4s do |t|
      t.string :name

      t.timestamps
    end
  end
end
