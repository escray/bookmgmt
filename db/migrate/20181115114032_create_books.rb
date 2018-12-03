class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :subheading
      t.string :author
      t.string :series_name
      t.string :language, default: '中文'
      t.string :original_name
      t.string :publisher
      t.string :translator
      t.string :editor
      t.string :pub_date
      t.string :pub_year
      t.string :edit_num, default: '1'
      t.integer :page
      t.string :remark
      t.string :isbn
      t.integer :copy, default: 1
      t.string :keyword
      t.decimal :price
      t.string :barcode
      t.string :image
      t.string :rate
      t.string :rate_num
      t.string :format, default: '平装'
      t.text :description
      t.string :book_class
      t.string :shelf_class
      t.string :shelf_num
      t.datetime :record_date

      t.timestamps
    end
  end
end
