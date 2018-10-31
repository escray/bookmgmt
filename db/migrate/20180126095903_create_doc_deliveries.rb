class CreateDocDeliveries < ActiveRecord::Migration[5.1]
  def change
    create_table :doc_deliveries do |t|
      t.integer :doc_id, index: true
      t.integer :department_id, index: true
      t.timestamps
    end
  end
end
