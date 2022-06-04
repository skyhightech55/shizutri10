class AddCategory3IdToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :category3_id, :integer
  end
end
