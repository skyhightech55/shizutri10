class Category3 < ApplicationRecord
  has_many :book_category3s
  has_many :books, through: :book_category3s
  has_ancestry
  def self.category3_parent_array_create
    category3_parent_array = ['---']
    Category3.where(ancestry: nil).each do |parent|
      category3_parent_array << [parent.name, parent.id]
    end
    return category3_parent_array
  end
end
