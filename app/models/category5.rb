class Category5 < ApplicationRecord
  has_many :book_category5s
  has_many :books, through: :book_category5s
  has_ancestry

  def self.category5_parent_array_create
    category5_parent_array = ['---']
    Category5.where(ancestry: nil).each do |parent|
      category5_parent_array << [parent.name, parent.id]
    end
    return category5_parent_array
  end
end
