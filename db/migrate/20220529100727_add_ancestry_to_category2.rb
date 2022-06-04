class AddAncestryToCategory2 < ActiveRecord::Migration[6.0]
  def change
    add_column :category2s, :ancestry, :string
    add_index :category2s, :ancestry
  end
end
