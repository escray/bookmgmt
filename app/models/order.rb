class Order < ApplicationRecord
  before_create :generate_token
  belongs_to :user

  validates :borrower, presence: true
  validates :borrow_at, presence: true

  has_many :borrow_lists

  def generate_token
    self.token = SecureRandom.uuid
  end
end
