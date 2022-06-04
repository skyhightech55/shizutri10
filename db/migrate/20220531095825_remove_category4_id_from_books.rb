class RemoveCategory4IdFromBooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :category4_id, :integer
  end
end
