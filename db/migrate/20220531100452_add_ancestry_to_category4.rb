class AddAncestryToCategory4 < ActiveRecord::Migration[6.0]
  def change
    add_column :category4s, :ancestry, :string
    add_index :category4s, :ancestry
  end
end
