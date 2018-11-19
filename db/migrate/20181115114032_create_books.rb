class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :pub_name
      t.string :pub_year
      t.string :edit_num
      t.integer :page
      t.string :series_name
      t.string :remark
      t.string :isbn
      t.integer :copy
      t.string :keyword
      t.decimal :price
      t.string :barcode
      t.string :class
      t.string :shelf_class
      t.string :shelf_num
      t.datetime :record_date

      t.timestamps
    end
  end
end
