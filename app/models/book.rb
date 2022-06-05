class Book < ApplicationRecord
  belongs_to :user, optional: true 
  has_many :book_categories
  has_many :categories, through: :book_categories
  has_many :book_category2s
  has_many :category2s, through: :book_category2s
  has_many :book_category3s
  has_many :category3s, through: :book_category3s
  has_many :book_category4s
  has_many :category4s, through: :book_category4s
  has_many :book_category5s
  has_many :category5s, through: :book_category5s
  has_many :book_category6s
  has_many :category6s, through: :book_category6s
  has_many :book_category7s
  has_many :category7s, through: :book_category7s
  attachment :image
end
