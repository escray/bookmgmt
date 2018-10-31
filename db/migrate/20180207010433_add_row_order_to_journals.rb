class AddRowOrderToJournals < ActiveRecord::Migration[5.1]
  def change
    add_column :journals, :row_order, :integer
    Journal.find_each do |j|
      j.update(row_order_position: :last)
    end
    add_index :journals, :row_order
  end
end
