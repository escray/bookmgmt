class Order < ApplicationRecord
  belongs_to :user

  validates :borrower, presence: true
  validates :borrow_at, presence: true

  has_many :borrow_lists
end
