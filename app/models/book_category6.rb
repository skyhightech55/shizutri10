class BookCategory6 < ApplicationRecord
  belongs_to :book
  belongs_to :category
  def self.maltilevel_category6_create(book, parent_id, children_id, grandchildren_id)
    if parent_id.present? && parent_id != '---'
      category6 = Category6.find(parent_id)
      BookCategory6.create(book_id: book.id, category6_id: category6.id)
    end

    if children_id.present? && children_id != '---'
      category6 = Category6.find(children_id)
      BookCategory6.create(book_id: book.id, category6_id: category6.id)
    end

    if grandchildren_id.present? && grandchildren_id != '---'
      category6 = Category6.find(grandchildren_id)
      BookCategory6.create(book_id: book.id, category6_id: category6.id)
    end
  end
end
