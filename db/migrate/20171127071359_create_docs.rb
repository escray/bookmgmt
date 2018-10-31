class CreateDocs < ActiveRecord::Migration[5.0]
  def change
    create_table :docs do |t|
      t.string :origin
      t.string :category
      t.datetime :receive
      t.datetime :publish_date
      t.text :description
      t.string :editor
      t.integer :amount
      t.timestamps
    end
  end
end
