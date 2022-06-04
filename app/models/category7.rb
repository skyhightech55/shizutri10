class Category7 < ApplicationRecord
  has_many :book_category7s
  has_many :books, through: :book_category7s
  has_ancestry
  def self.category7_parent_array_create
    category7_parent_array = ['---']
    Category7.where(ancestry: nil).each do |parent|
      category7_parent_array << [parent.name, parent.id]
    end
    return category7_parent_array
  end
end
