class BookCategory5 < ApplicationRecord
  belongs_to :book
  belongs_to :category5

  def self.maltilevel_category5_create(book, parent_id, children_id, grandchildren_id)
    if parent_id.present? && parent_id != '---'
      category5 = Category5.find(parent_id)
      BookCategory5.create(book_id: book.id, category5_id: category5.id)
    end

    if children_id.present? && children_id != '---'
      category5 = Category5.find(children_id)
      BookCategory5.create(book_id: book.id, category5_id: category5.id)
    end

    if grandchildren_id.present? && grandchildren_id != '---'
      category5 = Category5.find(grandchildren_id)
      BookCategory5.create(book_id: book.id, category5_id: category5.id)
    end
  end
end
