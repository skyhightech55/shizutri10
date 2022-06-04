class BookCategory3 < ApplicationRecord
  belongs_to :book
  belongs_to :category3
  
  def self.maltilevel_category3_create(book, parent_id, children_id, grandchildren_id)
    if parent_id.present? && parent_id != '---'
      category3 = Category3.find(parent_id)
      BookCategory3.create(book_id: book.id, category3_id: category3.id)
    end

    if children_id.present? && children_id != '---'
      category3 = Category3.find(children_id)
      BookCategory3.create(book_id: book.id, category3_id: category3.id)
    end

    if grandchildren_id.present? && grandchildren_id != '---'
      category3 = Category3.find(grandchildren_id)
      BookCategory3.create(book_id: book.id, category3_id: category3.id)
    end
  end
end
