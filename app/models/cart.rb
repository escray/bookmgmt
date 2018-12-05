class Cart < ApplicationRecord
  has_many :cart_items
  has_many :books, through: :cart_items, source: :book

  def add_book_to_cart(book)
    ci = cart_items.build
    ci.book = book
    ci.quantity = 1
    ci.save
  end

  def clean!
    cart_items.destroy_all
  end

  def total
    sum = 0
    cart_items.each do |cart_item|
      sum += cart_item.quantity if cart_item.book.present?
    end
    sum
  end
end
