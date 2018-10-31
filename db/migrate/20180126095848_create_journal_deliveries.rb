class CreateJournalDeliveries < ActiveRecord::Migration[5.1]
  def change
    create_table :journal_deliveries do |t|
      t.integer :journal_id, index: true
      t.integer :department_id, index: true
      t.timestamps
    end
  end
end
