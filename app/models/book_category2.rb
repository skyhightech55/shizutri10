class BookCategory2 < ApplicationRecord
  belongs_to :book
  belongs_to :category2

  def self.maltilevel_category2_create(book, parent_id, children_id, grandchildren_id)
    if parent_id.present? && parent_id != '---'
      category2 = Category2.find(parent_id)
      BookCategory2.create(book_id: book.id, category2_id: category2.id)
    end

    if children_id.present? && children_id != '---'
      category2 = Category2.find(children_id)
      BookCategory2.create(book_id: book.id, category2_id: category2.id)
    end

    if grandchildren_id.present? && grandchildren_id != '---'
      category2 = Category2.find(grandchildren_id)
      BookCategory2.create(book_id: book.id, category2_id: category2.id)
    end
  end
end
