class AddAncestryToCategory6 < ActiveRecord::Migration[6.0]
  def change
    add_column :category6s, :ancestry, :string
    add_index :category6s, :ancestry
  end
end
