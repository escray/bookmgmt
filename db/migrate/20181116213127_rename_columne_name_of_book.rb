class RenameColumneNameOfBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :description, :text
    rename_column :books, :class, :book_class
  end
end
