class BookCategory7 < ApplicationRecord
  belongs_to :book
  belongs_to :category7
  def self.maltilevel_category7_create(book, parent_id, children_id, grandchildren_id)
    if parent_id.present? && parent_id != '---'
      category7 = Category7.find(parent_id)
      BookCategory7.create(book_id: book.id, category7_id: category7.id)
    end

    if children_id.present? && children_id != '---'
      category7 = Category7.find(children_id)
      BookCategory7.create(book_id: book.id, category7_id: category7.id)
    end

    if grandchildren_id.present? && grandchildren_id != '---'
      category7 = Category7.find(grandchildren_id)
      BookCategory7.create(book_id: book.id, category7_id: category7.id)
    end
  end
end
