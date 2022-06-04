class AddAncestryToCategory7 < ActiveRecord::Migration[6.0]
  def change
    add_column :category7s, :ancestry, :string
    add_index :category7s, :ancestry
  end
end
