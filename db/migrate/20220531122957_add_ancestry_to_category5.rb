class AddAncestryToCategory5 < ActiveRecord::Migration[6.0]
  def change
    add_column :category5s, :ancestry, :string
    add_index :category5s, :ancestry
  end
end
