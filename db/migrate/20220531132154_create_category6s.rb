class CreateCategory6s < ActiveRecord::Migration[6.0]
  def change
    create_table :category6s do |t|
      t.string :name

      t.timestamps
    end
  end
end
