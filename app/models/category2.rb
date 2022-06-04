class Category2 < ApplicationRecord
  has_many :book_category2s
  has_many :books, through: :book_category2s
  has_ancestry
  def self.category2_parent_array_create
    category2_parent_array = ['---']
    Category2.where(ancestry: nil).each do |parent|
      category2_parent_array << [parent.name, parent.id]
    end
    return category2_parent_array
  end
end


