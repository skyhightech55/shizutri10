class Category6 < ApplicationRecord
  has_many :book_category6s
  has_many :books, through: :book_category6s
  has_ancestry
  def self.category6_parent_array_create
    category6_parent_array = ['---']
    Category6.where(ancestry: nil).each do |parent|
      category6_parent_array << [parent.name, parent.id]
    end
    return category6_parent_array
  end
end
