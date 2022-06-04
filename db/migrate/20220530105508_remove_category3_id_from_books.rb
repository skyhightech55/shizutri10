class RemoveCategory3IdFromBooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :category3_id, :integer
  end
end
