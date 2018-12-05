class CreateBorrowLists < ActiveRecord::Migration[5.2]
  def change
    create_table :borrow_lists do |t|
      t.integer :order_id
      t.integer :book_id
      t.integer :quantity
      t.timestamps
    end
  end
end
