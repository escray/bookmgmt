class CreateJournals < ActiveRecord::Migration[5.0]
  def change
    create_table :journals do |t|
      t.string :name
      t.string :publisher
      t.integer :interval
      t.integer :amount
      t.string :delivery
      t.text :description
      t.string :image

      t.timestamps null: false
    end
  end
end
