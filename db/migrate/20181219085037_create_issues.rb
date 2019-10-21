class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.integer :magazine_id
      t.integer :year
      t.integer :issue_num
      t.string :barcode
      t.string :shelf_class
      t.string :shelf_num
      t.string :status, default: '在馆'
      t.text :details
      t.string :cover
      t.timestamps
    end
  end
end
