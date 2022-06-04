class BookCategory4 < ApplicationRecord
  belongs_to :book
  belongs_to :category4

  def self.maltilevel_category4_create(book, parent_id, children_id, grandchildren_id)
    if parent_id.present? && parent_id != '---'
      category4 = Category4.find(parent_id)
      BookCategory4.create(book_id: book.id, category4_id: category4.id)
    end

    if children_id.present? && children_id != '---'
      category4 = Category4.find(children_id)
      BookCategory4.create(book_id: book.id, category4_id: category4.id)
    end

    if grandchildren_id.present? && grandchildren_id != '---'
      category4 = Category4.find(grandchildren_id)
      BookCategory4.create(book_id: book.id, category4_id: category4.id)
    end
  end
end
