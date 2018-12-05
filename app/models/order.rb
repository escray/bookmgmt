class Order < ApplicationRecord
  belongs_to :user

  validates :borrower, present: true
  validates :borrow_at, present: true
end
