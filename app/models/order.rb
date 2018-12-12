class Order < ApplicationRecord
  include AASM

  aasm do
    state :borrow_required, initial: true
    state :prepared
    state :lended
    state :order_cancelled
    state :book_returned

    event :prepare do
      transitions from: :borrow_required, to: :prepared
    end

    event :lend do
      transitions from: :prepared, to: :lended
    end

    event :return_book do
      transitions from: :lended, to: :book_returned
    end

    event :cancel_order do
      transitions from: %i[order_placed prepared], to: :order_cancelled
    end
  end

  before_create :generate_token
  belongs_to :user

  validates :borrower, presence: true
  validates :borrow_at, presence: true

  has_many :borrow_lists

  def generate_token
    self.token = SecureRandom.uuid
  end
end
