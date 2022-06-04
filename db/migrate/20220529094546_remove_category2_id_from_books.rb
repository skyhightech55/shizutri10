class RemoveCategory2IdFromBooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :category2_id, :integer
  end
end
