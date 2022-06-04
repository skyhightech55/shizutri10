class Category4 < ApplicationRecord
  has_many :book_category4s
  has_many :books, through: :book_category4s
  has_ancestry
  def self.category4_parent_array_create
    category4_parent_array = ['---']
    Category4.where(ancestry: nil).each do |parent|
      category4_parent_array << [parent.name, parent.id]
    end
    return category4_parent_array
  end
end
