class CreateCsvImports < ActiveRecord::Migration[5.1]
  def change
    create_table :csv_imports do |t|
      t.string :status
      t.string :csv_file
      t.string :import_type, default: 'doc'
      t.integer :user_id
      t.integer :total_count
      t.integer :success_count
      t.text :error_message
      t.timestamps
    end
  end
end
