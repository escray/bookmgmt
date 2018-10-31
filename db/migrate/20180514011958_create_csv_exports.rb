class CreateCsvExports < ActiveRecord::Migration[5.1]
  def change
    create_table :csv_exports do |t|
      t.string :status
      t.string :csv_file
      t.string :export_type, default: 'doc'
      t.integer :user_id
      t.integer :total_count
      t.integer :success_count
      t.text :error_messages
      t.timestamps
    end
  end
end
