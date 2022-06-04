class CreateCategory3s < ActiveRecord::Migration[6.0]
  def change
    create_table :category3s do |t|
      t.string :name

      t.timestamps
    end
  end
end
