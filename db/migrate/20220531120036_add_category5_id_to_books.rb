class AddCategory5IdToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :category5_id, :integer
  end
end
