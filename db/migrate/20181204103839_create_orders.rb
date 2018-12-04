class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :borrower
      t.datetime :borrow_at
      t.datetime :due_at
      t.timestamps
    end
  end
end
