class AddStatusToDocs < ActiveRecord::Migration[5.1]
  def change
    add_column :docs, :status, :string, default: 'available'
  end
end
