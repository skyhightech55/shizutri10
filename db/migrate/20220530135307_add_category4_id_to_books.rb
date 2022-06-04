class AddCategory4IdToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :category4_id, :integer
  end
end
