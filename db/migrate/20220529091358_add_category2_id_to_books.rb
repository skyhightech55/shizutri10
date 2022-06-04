class AddCategory2IdToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :category2_id, :integer
  end
end
