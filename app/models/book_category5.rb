class BookCategory5 < ApplicationRecord
  belongs_to :book
  belongs_to :category5

  def self.maltilevel_category5_create(book, parent_id, children5_id, grandchildren5_id)
    if parent_id.present? && parent_id != '---'
      category5 = Category5.find(parent_id)
      BookCategory5.create(book_id: book.id, category5_id: category5.id)
    end

    if children5_id.present? && children5_id != '---'
      category5 = Category5.find(children5_id)
      BookCategory5.create(book_id: book.id, category5_id: category5.id)
    end

    if grandchildren5_id.present? && grandchildren5_id != '---'
      category5 = Category5.find(grandchildren5_id)
      BookCategory5.create(book_id: book.id, category5_id: category5.id)
    end
  end
end
