class RemoveCategoryIdFromBooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :category_id, :integer
  end
end
