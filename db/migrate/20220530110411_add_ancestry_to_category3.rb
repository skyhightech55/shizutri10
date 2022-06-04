class AddAncestryToCategory3 < ActiveRecord::Migration[6.0]
  def change
    add_column :category3s, :ancestry, :string
    add_index :category3s, :ancestry
  end
end
